class CategoriesController < ApplicationController
  skip_before_action :authenticate_employee!, only: %i[index show]
  after_action :verify_authorized, except: :index, unless: :skip_pundit?

  def index
    if current_employee.present? && current_employee.role == "manager"
      @target_restaurant = current_employee.restaurant
      # for the add menu item form
      @menu_item = MenuItem.new(restaurant: current_employee.restaurant)
      @restaurant = current_employee.restaurant
    else
      @target_restaurant = Restaurant.find(session[:restaurant]["id"])
      @order = Order.find(session[:order]["id"])
    end
    categories_ids = MenuItem.where(restaurant_id: @target_restaurant).pluck(:category_id).uniq
    @categories = Category.where(id: categories_ids).includes(:menu_items)
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
    params.require(:category).permit(:title)
  end
end
