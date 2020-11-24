class CategoriesController < ApplicationController
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render ######
    end
  end

  def index
    @categories = Category.where(restaurant: session[:restaurant])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
