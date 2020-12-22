# class InventoriesController < ApplicationController
#   def index
#     @restaurant = Restaurant.find(params[:restaurant_id])
#     @inventories = @restaurant.inventories.includes(:menu_item).order(:stock_amount_grams)
#   end
# end
