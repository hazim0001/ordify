class OrdersController < ApplicationController
  after_action :verify_authorized, only: :index, unless: :skip_pundit?
  skip_before_action :authenticate_employee!, only: %i[new create update dispatch_notify]

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
    raise
    if @order.save
      session[:order] = @order
      redirect_to categories_path
    else
      render :new
    end
  end

  def index
    @orders = Order.where(table: session[:table]["id"])
    authorize @orders
  end

  def update
    @order = Order.find(params[:id])
    @order.line_items.each { |line| line.update(ordered: true) }
    @order.update(sent: true, dispatched: false)
    undispatched_line_items = @order.table.line_items.where(dispatched_from_kitchen: false)
    KitchenOrderChannel.broadcast_to(
      @order.table, render_to_string(partial: "new_line_item", locals: { lines: undispatched_line_items })
    )
    sleep(4)
    stripe_order
    redirect_back fallback_location: proc { order_line_items_path(@order) }
  end

  def dispatch_notify
    @order = Order.find(params[:id])
    @order.table.line_items.each { |line| line.update(dispatched_from_kitchen: true) }
    @order.table.orders.each do |order|
      order.update(dispatched: true)
      twilio_sms
    end
    redirect_back fallback_location: proc { restaurant_tables_path(@order.restaurant) }
  end

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

  def twilio_sms
    # account_sid = ENV['ACCOUNT_SID']
    # auth_token = ENV['AUTH_TOKEN']
    # client = Twilio::REST::Client.new(account_sid, auth_token)
    # # raise
    # from = '+12056547036' # Your Twilio number
    # to = '+529841452138'          # order.user_number # Your mobile phone number
    # client.messages.create(
    #   from: from,
    #   to: to,
    #   body: "Hola from Ordify!, Your Meal is on the way"
    # )
    # return
  end

  def order_params
    params.require(:order).permit(:table, :user_number)
  end
end
