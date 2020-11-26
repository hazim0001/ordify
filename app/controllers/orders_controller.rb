class OrdersController < ApplicationController
  after_action :verify_authorized, only: :index, unless: :skip_pundit?
  skip_before_action :authenticate_employee!, only: %i[new create]

  def new
    @order = Order.new
    session[:table] = Table.find(params[:table_id])
    table = Table.find(session[:table]["id"])
    session[:restaurant] = table.restaurant
  end

  def create
    @table = Table.find(params[:table_id])
    @order = Order.new(order_params)
    @order.table = @table
    if @order.save
      redirect_to categories_path
    else
      render :new
    end
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
