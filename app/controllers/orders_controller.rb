class OrdersController < ApplicationController
  # after_action :verify_authorized, only: :index, unless: :skip_pundit?
  skip_before_action :authenticate_employee!, only: %i[new create update pay]

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
      # stripe_order
      redirect_to categories_path
    else
      render :new
    end
  end

  def index
    raise
    @orders = Order.where(table: session[:table]["id"])
    authorize @orders
  end

  def update
    @order = Order.find(params[:id])
    raise
    # stripe_order
    @order.update(sent: true)
    stripe_order
    sleep(2)
    redirect_back fallback_location: proc { order_line_items_path(@order) }
    # raise
  end

  # def pay
  # # #   raise
  # #   @order = Order.find(params[:id])
  #   stripe_order
  # # #   redirect_back fallback_location: proc { order_line_items_path(@order) }
  # # #   # # raise
  # end

  private

  def stripe_order
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @order.user_number,
        amount: @order.total_price_cents,
        currency: 'usd',
        quantity: 1
      }],
      mode: 'payment',
      success_url: new_table_order_url(@order.table), # to create a thank u page for ur payment
      cancel_url: categories_url # render a notice tell him to try a dif card
    )
    @order.update(checkout_session_id: session.id)
  end

  def order_params
    params.require(:order).permit(:table, :user_number)
  end
end
