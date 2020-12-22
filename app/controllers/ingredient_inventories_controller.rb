class IngredientInventoriesController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    # @inventories = @restaurant.inventories.includes(:menu_item).order(:stock_amount_grams)
    @inventory_refill = InventoryRefill.new
  end

  def create
    raise
  end

  def update
  end

  def destroy
  end
end
