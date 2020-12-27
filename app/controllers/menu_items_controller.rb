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
      menu_items_zero(menu_items, restaurant)
    else
      @menu_items = MenuItem.active_and_related(restaurant, @category) # where(restaurant: restaurant).where(category: @category).where(active: true)
    end
  end

  def show
    @order = Order.find(session[:order]["id"])
    @line_item = LineItem.new
    restaurant = Restaurant.find(session[:restaurant]["id"])
    ingredient_inventories_ids = restaurant.ingredients.pluck(:ingredient_inventory_id).uniq
    @extras = Extra.where(ingredient_inventory_id: ingredient_inventories_ids)
  end

  def new
    @menu_item = MenuItem.new(restaurant: current_employee.restaurant)
    @restaurant = current_employee.restaurant
    authorize @menu_item
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu_item.restaurant = @restaurant
    @menu_item.category.menu_items_count += 1
    authorize @menu_item
    if @menu_item.save
      # creating the ingredients for the menu item
      params[:ingredient_id].each_with_index do |id, index|
        ingredient = IngredientInventory.find(id)
        Ingredient.create(
          menu_item: @menu_item,
          ingredient_inventory: ingredient,
          ingredient_portion_size_grams: params[:ingredient_portion_size][index].to_i,
          title: "#{ingredient.name} for #{@menu_item.title}"
        )
      end
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
    authorize @menu_item
    @restaurant = current_employee.restaurant
  end

  def update
    authorize @menu_item
    if @menu_item.update(menu_item_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    authorize @menu_item
    @menu_item.destroy
    redirect_to categories_path
  end

  private

  def menu_items_zero(menu_items, restaurant)
    if menu_items.count.zero?
      menu_items = MenuItem.all
      notice_content = "Sorry, none of our dishes have '#{params[:query]}'."
      @menu_items = menu_items.active_and_related(restaurant, @category) # where(restaurant: restaurant).where(category: @category).where(active: true)
      redirect_back fallback_location: proc { category_menu_items_path(@category) }, notice: notice_content
    else
      @menu_items = menu_items.where(restaurant: restaurant).active
    end
  end

  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

  def menu_item_params
    params.require(:menu_item).permit(:title, :restaurant, :item_price, :description, :category_id, :active, :accepts_extra, photos: [])
  end
end
