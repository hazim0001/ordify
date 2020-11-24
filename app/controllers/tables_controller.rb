class TablesController < ApplicationController
  before_action :set_table, only: %i[show destroy]
  after_action :verify_authorized, unless: :skip_pundit?

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @table = Table.new(table_params)
    @table.restaurant = @restaurant
    @table.save
    authorize @table
    redirect_to tables_path
  end

  def index
    @tables = Table.where(restaurant: params[:restaurant_id])
    authorize @tables
  end

  def show
    authorize @table
  end

  def destroy
    authorize @table
    @table.destroy
    redirect_to tables_path
  end

  private

  def set_table
    @table = Table.find(params[:id])
  end

  def table_params
    params.require(:table).permit(:name, :restaurant)
  end
end
