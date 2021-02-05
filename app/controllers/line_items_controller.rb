class LineItemsController < ApplicationController
  before_action :set_line_item, only: %i[update destroy edit shallow_delete]
  skip_before_action :authenticate_employee!, only: %i[index create update destroy]
  after_action :verify_authorized, only: :destroy, unless: :skip_pundit?

  def create
    # raise
    @line_item = LineItem.new(line_item_params)
    @line_item.quantity = params["quantity"]
    @line_item.menu_item = MenuItem.find(params["menu_item_id"])
    @line_item.order = Order.find(params[:order_id]) # session[:order]["id"]
    category = @line_item.menu_item.category
    @line_item.save
    if params[:extras_id].present?
      params[:extras_id].each do |extra_id|
        extra = Extra.find(extra_id)
        AddExtra.create(line_item: @line_item, extra: extra)
      end
    end
    update_totals_in_line_item_and_order
    update_inventory
    redirect_to category_menu_items_path(category)
  end

  def index
    @line_items = LineItem.inside_order_no(params[:order_id]).includes(:menu_item) # where("order_id= ?", params[:order_id]).order(created_at: :desc)
    @order = Order.find(session[:order]["id"])
  end

  # def edit; end

  def update
    return_inventory
    if manager_is_here?
      @line_item.update(line_item_params)
      update_totals_in_line_item_and_order
      update_inventory
      redirect_to orders_path
    else
      @line_item.update!(quantity: params["quantity"].to_i)
      update_totals_in_line_item_and_order
      update_inventory
      @line_item.destroy if @line_item.quantity.zero?
      redirect_to order_line_items_path
    end
  end

  def shallow_delete
    @line_item.order.update(total_price_cents: (@line_item.order.total_price_cents - @line_item.total_cents))
    @line_item.update(
      deleted: true,
      deleted_at: Time.now,
      deleted_by: current_employee.name,
      line_deletion_reason: line_item_params[:line_deletion_reason]
    )
    return_inventory
    redirect_back fallback_location: proc { orders_path }
  end

  def destroy
    order = @line_item.order
    @line_item.order.update(total_price_cents: (@line_item.order.total_price_cents - @line_item.total_cents))
    return_inventory
    authorize @line_item
    @line_item.destroy
    if employee_is_manager?
      redirect_to orders_path
    else
      redirect_to order_line_items_path(order)
    end
  end

  private

  def update_totals_in_line_item_and_order
    @line_item.update(total_cents: @line_item.menu_item.item_price_cents * @line_item.quantity)
    sub_total = LineItem.where(order: @line_item.order.id).sum(:total_cents)
    extra_total = @line_item.extras.sum(:extra_price_cents)
    @line_item.order.update(total_price_cents: (sub_total + extra_total), sent: false)
  end

  def update_inventory
    @line_item.menu_item.ingredients.each do |ingredient|
      portion = ingredient.ingredient_portion_size_grams
      quantity = @line_item.quantity
      current_stock = ingredient.ingredient_inventory.stock_amount_grams
      ingredient.ingredient_inventory.update(stock_amount_grams: current_stock - (portion * quantity))
    end
    # raise
    if @line_item.extras.any?
      @line_item.extras.each do |extra|
        portion = extra.size_grams
        current_stock = extra.ingredient_inventory.stock_amount_grams
        extra.ingredient_inventory.update(stock_amount_grams: current_stock - portion)
      end
    end
    # trigger_limit = @line_item.menu_item.inventory.trigger_limit
    # InventoryCheckJob.perform_later if trigger_limit >= current_stock && @line_item.ordered == true
  end

  def return_inventory
    @line_item.menu_item.ingredients.each do |ingredient|
      portion = ingredient.ingredient_portion_size_grams
      quantity = @line_item.quantity
      current_stock = ingredient.ingredient_inventory.stock_amount_grams
      ingredient.ingredient_inventory.update(stock_amount_grams: current_stock + (portion * quantity))
    end

    return unless @line_item.extras.any?

    @line_item.extras.each do |extra|
      portion = extra.size_grams
      current_stock = extra.ingredient_inventory.stock_amount_grams
      extra.ingredient_inventory.update(stock_amount_grams: current_stock + portion)
    end
  end

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:comment, :quantity, :line_deletion_reason, :menu_item_id, :order_id)
  end
end
