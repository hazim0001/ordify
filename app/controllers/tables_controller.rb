class TablesController < ApplicationController
  before_action :set_table, only: %i[show destroy]

  def create
    @table = Table.create(table_params)
    redirect_to tables_path
  end

  def index
    @tables = Table.where(restaurant: params[:restaurant_id])
  end

  def show; end

  def destroy
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
