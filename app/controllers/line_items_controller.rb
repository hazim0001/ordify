class LineItemsController < ApplicationController
  before_action :set_line_item, only: %i[update destroy]
  skip_before_action :authenticate_employee!, only: %i[index create update destroy]

  def create
    @line_item = LineItem.new(line_item_params)
    category = @line_item.menu_item.category # to be tested on console
    @line_item.save
    update_totals_in_line_item_and_order
    redirect_to category_path(category)
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
    @line_item.order.update(total_price: @line_item.order.total_price - (@line_item.total * @line_item.quantity))
    @line_item.destroy
    redirect_to line_items_path
  end

  private

  def update_totals_in_line_item_and_order
    @line_item.update(total: @line_item.menu_item.item_price * @line_item.quantity)
    sub_total = LineItem.where(order: @line_item.order.id).sum(:total)
    @line_item.order.update(total_price: sub_total)
  end

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:menu_item, :comment, :quantity, :order)
  end
end
