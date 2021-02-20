require 'json'
require 'byebug'
require "net/https"
require "uri"

class OrdersController < ApplicationController
  after_action :verify_authorized, only: :index, unless: :skip_pundit?
  skip_before_action :authenticate_employee!, only: %i[new create update dispatch_notify pay]

  def new
    @order = Order.new
    if manager_is_here?
      @tables = current_employee_restaurant.tables
      @categories = current_employee_restaurant.categories.includes(:menu_items)
      @restaurant = current_employee_restaurant
    else
      session[:table] = Table.find(params[:table_id])
      table = Table.find(session[:table]["id"])
      session[:restaurant] = table.restaurant
    end
  end

  def create
    if manager_is_here?
      # raise
      @order = Order.create(table_id: order_params[:table].to_i, user_number: order_params[:user_number])
      params[:menu_item_id].each_with_index do |id, index|
        line_item = LineItem.create(
          menu_item_id: id.to_i, order: @order, quantity: params[:quantity][index], ordered: true, received_at: Time.now
        )
        # updating line item total and order total
        line_item.update(total_cents: line_item.menu_item.item_price_cents * line_item.quantity)
        # updating inventory
        # line_item.menu_item.ingredients.each do |ingredient|
        #   portion = ingredient.ingredient_portion_size_grams
        #   quantity = line_item.quantity
        #   current_stock = ingredient.ingredient_inventory.stock_amount_grams
        #   ingredient.ingredient_inventory.update(stock_amount_grams: current_stock - (portion * quantity))
        # end
      end
      # where("dispatched_from_kitchen= ?", false)
      undispatched_line_items = @order.table.line_items.not_dispatched_from_kitchen
      KitchenOrderChannel.broadcast_to(
        @order.table, render_to_string(partial: "new_line_item", locals: { lines: undispatched_line_items })
      )
      sub_total = LineItem.where(order: @order).sum(:total_cents)
      @order.update(total_price_cents: sub_total, sent: true)
      flash[:notice] = "Order##{@order.id} has been created and sent to the kitchen"
      redirect_to new_restaurant_order_path(current_employee_restaurant)
    else
      @table = Table.find(params[:table_id])
      @order = Order.find_or_initialize_by(user_number: order_params[:user_number], status: "not paid") # Order.new(order_params)
      @order.table = @table
      if @order.save
        session[:order] = @order
        redirect_to categories_path
      else
        render :new
      end
    end
  end

  def index
    if manager_is_here?
      @orders = current_employee.restaurant.orders
      @tables = current_employee.restaurant.tables
    else
      @orders = Order.where(table: session[:table]["id"]).includes(:restaurant)
    end
    authorize @orders
  end

  def display
    @orders = current_employee_restaurant.orders.includes(:table, line_items: [:menu_item]).order("created_at DESC")
  end

  def update
    @order = Order.find(params[:id])
    # if manager_is_here?
    #   @order.update(table_id: order_params[:table].to_i, status: order_params[:status])
    #   @order.update(from_order_to_checkout: Time.now - @order.created_at) if @order.status == "paid"
    #   redirect_to orders_path
    # else
    @order.line_items.each { |line| line.update(ordered: true, received_at: Time.now) }
    @order.update(sent: true, dispatched: false)
    undispatched_line_items = @order.table.line_items.not_dispatched_from_kitchen # where("dispatched_from_kitchen= ?", false)
    KitchenOrderChannel.broadcast_to(
      @order.table, render_to_string(partial: "new_line_item", locals: { lines: undispatched_line_items })
    )
    sleep(2)
    redirect_back fallback_location: proc { order_line_items_path(@order) }
    # end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end

  def shallow_delete
    @order = Order.find(params[:id])
    @order.line_items.each { |line| line.update(deleted: true, deleted_at: Time.now, deleted_by: current_employee.name) }
    @order.update(
      order_deleted: true,
      order_deleted_at: Time.now,
      order_deleted_by: current_employee.name,
      deletion_reason: order_params[:deletion_reason]
    )
    redirect_back fallback_location: proc { orders_path }
  end

  # def dispatch_notify
  #   @order = Order.find(params[:id])
  #   update_line_items
  #   @order.table.line_items.each { |line| line.update(dispatched_from_kitchen: true) }
  #   @order.table.orders.each do |order|
  #     order.update(dispatched: true)
  #     twilio_sms
  #   end
  #   redirect_back fallback_location: proc { restaurant_tables_path(@order.restaurant) }
  # end

  def pay
    auth_token = authentication_request
    payment_id = order_registration_api(auth_token)
    payment_token = payment_key_request(payment_id, auth_token)
    redirect_to("https://accept.paymob.com/api/acceptance/iframes/165991?payment_token=#{payment_token}")
  end

  private

  def update_line_items
    @order.table.line_items.each do |line|
      line.update(dispatched_from_kitchen: true, dispatched_at: Time.now)
      line.update(total_kitchen_time: (line.dispatched_at - line.received_at))
    end
  end

  # pay mob methods

  def authentication_request
    uri = URI.parse('https://accept.paymobsolutions.com/api/auth/tokens')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    req = Net::HTTP::Post.new(uri.path, { "Content-Type": "application/json", "Accept": "application/json" })
    req.body = { "api_key": ENV['PAY_MOB_API_KEY'] }.to_json
    res = http.request(req)
    reply = JSON.parse(res.body)
    reply["token"]
  end

  def order_registration_api(auth_token)
    uri = URI.parse('https://accept.paymobsolutions.com/api/ecommerce/orders')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    req = Net::HTTP::Post.new(uri.path, { "Content-Type": "application/json", "Accept": "application/json" })
    req.body = {
      "auth_token": auth_token,
      "delivery_needed": "false",
      "amount_cents": "1000",
      "currency": "EGP",
      "items": [
        {
          "name": "Test item",
          "amount_cents": "500",
          "description": "Test item",
          "quantity": "2"
        }
      ]
    }.to_json
    res = http.request(req)
    reply = JSON.parse(res.body)
    reply["id"]
  end

  def payment_key_request(payment_id, auth_token)
    uri = URI.parse('https://accept.paymobsolutions.com/api/acceptance/payment_keys')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    req = Net::HTTP::Post.new(uri.path, { "Content-Type": "application/json", "Accept": "application/json" })
    req.body = {
      "auth_token": auth_token,
      "amount_cents": "100",
      "expiration": 6000,
      "order_id": payment_id,
      "billing_data": {
        "apartment": "NA",
        "email": "test@test.com",
        "floor": "NA",
        "first_name": "test",
        "street": "NA",
        "building": "NA",
        "phone_number": "00000000000",
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": "test",
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": 171_112
    }.to_json
    res = http.request(req)
    reply = JSON.parse(res.body)
    reply["token"]
  end

  def order_params
    params.require(:order).permit(:table, :user_number, :status, :deletion_reason)
  end
end
