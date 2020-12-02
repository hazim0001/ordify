class KitchenOrderChannel < ApplicationCable::Channel
  def subscribed
    restaurant = Restaurant.find(params[:id])
    restaurant.tables.each { |t| stream_for t }
  end

  # def unsubscribed
  #   # Any cleanup needed when channel is unsubscribed
  # end
end
