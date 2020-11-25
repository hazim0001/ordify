class CategoriesController < ApplicationController
  skip_before_action :authenticate_employee!, only: %i[index show]
  after_action :verify_authorized, except: :index, unless: :skip_pundit?

  def index
    target_restaurant = session[:restaurant]
    @categories = target_restaurant.categories
    raise
    # THIS IS WRONG
    # @categories = Category.where(restaurant: session[:restaurant])
    # authorize @categories
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
