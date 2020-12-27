class CategoriesController < ApplicationController
  skip_before_action :authenticate_employee!, only: %i[index show]
  after_action :verify_authorized, except: :index, unless: :skip_pundit?

  def index
    if manager_is_here?
      @target_restaurant = current_employee.restaurant
      # for the add menu item form
      @menu_item = MenuItem.new(restaurant: @target_restaurant)
      @restaurant = @target_restaurant
      @category = Category.new
    else
      @target_restaurant = Restaurant.find(session[:restaurant]["id"])
      @order = Order.find(session[:order]["id"])
    end
    # categories_ids = MenuItem.where(restaurant_id: @target_restaurant).pluck(:category_id).uniq
    @categories = @target_restaurant.categories.order(menu_items_count: :DESC)

    # @categories = Category.where(id: categories_ids).includes(menu_items: %i[photos_attachments])
  end

  def create
    @category = Category.new(category_params)
    authorize @category
    if @category.save
      redirect_to categories_path
    else
      render ######
    end
  end

  def destroy
    @category = Category.find(params[:id])
    authorize @category
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title, :restaurant_id)
  end
end
