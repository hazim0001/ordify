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
      session[:order] = @order
      stripe_order
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

  def stripe_order
    # session = Stripe::Checkout::Session.create(
    #   payment_method_types: ['card'],
    #   line_items: [{
    #     name: @order.user_number,
    #     amount: @order.total_cents,
    #     currency: 'mex'
    #   }],
    #   success_url: , #render thank you for your payment,
    #   cancel_url: # render a notice tell him to try a dif card
    # )
    # @order.update(checkout_session_id: session.id)
  end

  def order_params
    params.require(:order).permit(:table, :user_number)
  end
end
