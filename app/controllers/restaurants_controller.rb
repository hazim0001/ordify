class RestaurantsController < ApplicationController
  # before_action :find_restaurant, only: :dashboard
  def dashboard
    @restaurant = current_employee.restaurant
    # to get the past week
    # .where('created_at > ?', 1.week.ago)

    # @menu_items_array = @restaurant.line_items.limit(10).order(:created_at).pluck(:title)
    # counts = Hash.new 0
    # @menu_items_array.each do |menu_item|
    #   counts[menu_item] += 1
    # end
    # @menu_items_sales_count = counts
  end
end
