class LineItemsController < ApplicationController
  before_action :set_line_item, only: %i[update destroy]
  skip_before_action :authenticate_employee!, only: %i[index create update destroy]
  after_action :verify_authorized, only: :destroy, unless: :skip_pundit?

  def create
    @line_item = LineItem.new(line_item_params)
    @line_item.quantity = params["custom-input-number"]
    @line_item.menu_item = MenuItem.find(params["menu_item"])
    @line_item.order = Order.find(session[:order]["id"])
    category = @line_item.menu_item.category # to be tested on console
    @line_item.save
    update_totals_in_line_item_and_order
    redirect_to category_menu_items_path(category)
  end

  def index
    @line_items = LineItem.where(order: params[:order_id])
  end

  def update
    @line_item.update(line_item_params)
    update_totals_in_line_item_and_order
    redirect_to line_items_path
  end

  def destroy
    order = @line_item.order
    @line_item.order.update(total_price: (@line_item.order.total_price - @line_item.total))
    authorize @line_item
    @line_item.destroy
    redirect_to order_line_items_path(order)
  end

  private

  def update_totals_in_line_item_and_order
    @line_item.update(total: @line_item.menu_item.item_price * @line_item.quantity)
    sub_total = LineItem.where(order: @line_item.order.id).sum(:total_cents)
    @line_item.order.update(total_price_cents: sub_total)
  end

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:comment)
  end
end
