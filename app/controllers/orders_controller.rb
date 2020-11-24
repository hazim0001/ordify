class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.create(order_params)
    redirect_to categories_path
  end

  def index
    @orders = Order.where(table: session[:table])
  end

  private

  def order_params
    params.require(:order).permit(:table, :user_number)
  end
end
