class LineItemsController < ApplicationController
  before_action :set_line_item, only: %i[update destroy]

  def create
    @line_item = LineItem.new(line_item_params)
    category = @line_item.menu_item.category # to be tested on console
    @line_item.save
    redirect_to category_path(category)
  end

  def index
    @line_items = LineItem.where(order: params[:order_id])
  end

  def update
    @line_item.update(line_item_params)
    redirect_to line_items_path
  end

  def destroy
    @line_item.destroy
    redirect_to line_items_path
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:menu_item, :comment, :quantity, :order)
  end
end
