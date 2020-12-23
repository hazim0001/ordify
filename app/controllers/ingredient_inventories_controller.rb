class IngredientInventoriesController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    # @inventories = @restaurant.inventories.includes(:menu_item).order(:stock_amount_grams)
    @inventory_refill = InventoryRefill.new
    ingredient_inventories_ids = current_employee.restaurant.ingredients.pluck(:ingredient_inventory_id).uniq
    @ingredient_inventories = IngredientInventory.where(id: ingredient_inventories_ids)
  end

  def create
    raise
  end

  def update
  end

  def destroy
  end
end
