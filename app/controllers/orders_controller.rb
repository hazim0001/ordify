class OrdersController < ApplicationController
  after_action :verify_authorized, only: :index, unless: :skip_pundit?
  skip_before_action :authenticate_employee!, only: %i[new create]

  def new
    @order = Order.new
    session[:table] = Table.find(params[:table_id])
    session[:restaurant] = session[:table].restaurant
  end

  def create
    @order = Order.create(order_params)
    redirect_to categories_path
  end

  def index
    @orders = Order.where(table: session[:table])
    authorize @orders
  end

  private

  def order_params
    params.require(:order).permit(:table, :user_number)
  end
end
