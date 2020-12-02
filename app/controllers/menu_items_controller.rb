class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: %i[show edit update destroy]
  skip_before_action :authenticate_employee!, only: %i[index show]
  after_action :verify_authorized, except: %i[index show], unless: :skip_pundit?

  def index
    restaurant = Restaurant.find(session[:restaurant]["id"])
    @category = Category.find(params[:category_id])
    @order = Order.find(session[:order]["id"])
    if params[:query].present?
      sql_query = "title @@ :query OR description @@ :query"
      menu_items = MenuItem.where(sql_query, query: "%#{params[:query]}%")
      if current_employee.present? && current_employee.role == "manager"
        @menu_items = menu_items.where(restaurant: restaurant).where(category: @category)
      else # for restaurant users and kitchen
        @menu_items = menu_items.where(restaurant: restaurant).where(category: @category).where(active: true)
      end
    else
      if current_employee.present? && current_employee.role == "manager"
        @menu_items = MenuItem.where(restaurant: restaurant).where(category: @category)
      else # for restaurant users and kitchen
        @menu_items = MenuItem.where(restaurant: restaurant).where(category: @category).where(active: true)
      end
    end
  end

  def show
    @order = Order.find(session[:order]["id"])
    @line_item = LineItem.new
  end

  def new
    @menu_item = MenuItem.new
    authorize @menu_item
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    authorize @menu_item
    @menu_item.restaurant = @restaurant
    if @menu_item.save
      redirect_to menu_items_path
    else
      render :new
    end
  end

  def edit
    authorize @menu_item
  end

  def update
    authorize @menu_item
    if @menu_item.update(menu_item_params)
      redirect_to menu_item_path(@menu_item)
    else
      render :edit
    end
  end

  def destroy
    authorize @menu_item
    @menu_item.destroy
    redirect_to menu_items_path
  end

  private

  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

  def menu_item_params
    params.require(:menu_item).permit(:title, :restaurant, :item_price, :description, :category, :active, photos: [])
  end
end
