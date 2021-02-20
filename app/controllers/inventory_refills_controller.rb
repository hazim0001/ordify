# class InventoryRefillsController < ApplicationController
#   def index
#   end

#   def create
#     InventoryRefill.create(inventory_refill_params)
#     re_stock_ingredient = IngredientInventory.find(inventory_refill_params[:ingredient_inventory_id])
#     re_stock_ingredient.update(
#       stock_amount_grams: re_stock_ingredient.stock_amount_grams + inventory_refill_params[:refill_amount].to_i
#     )
#     redirect_to restaurant_ingredient_inventories_path(current_employee.restaurant)
#   end

#   private

#   def inventory_refill_params
#     params.require(:inventory_refill).permit(:refill_amount, :ingredient_inventory_id)
#   end
# end
