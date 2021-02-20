# class IngredientInventoriesController < ApplicationController
#   def index
#     @restaurant = Restaurant.find(params[:restaurant_id])
#     # @inventories = @restaurant.inventories.includes(:menu_item).order(:stock_amount_grams)
#     @inventory_refill = InventoryRefill.new
#     ingredient_inventories_ids = @restaurant.ingredients.pluck(:ingredient_inventory_id).uniq
#     @ingredient_inventories = IngredientInventory.where(id: ingredient_inventories_ids).includes(:extras).includes(:ingredients).includes(:menu_items).includes(:inventory_refills)
#   end

#   def create
#     raise
#   end

#   def update
#   end

#   def destroy
#   end
# end
