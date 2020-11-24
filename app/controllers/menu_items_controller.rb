class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: %i[show edit update destroy]

  def index
    restaurant = params[:category_id].restaurant
    @menu_items = MenuItem.where(restaurant: restaurant)
  end

  def show; end

  def new
    @menu_item = MenuItem.new
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)
    if @menu_item.save
      redirect_to menu_items_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @menu_item.update(menu_item_params)
      redirect_to menu_item_path(@menu_item)
    else
      render :edit
    end
  end

  def destroy
    @menu_item.destroy
    redirect_to menu_items_path
  end

  private

  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

  def menu_item_params
    params.require(:menu_item).permit(:title, :restaurant, :item_price, :description, :category, :active)
  end
end
