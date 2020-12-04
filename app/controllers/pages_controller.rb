class PagesController < ApplicationController
  skip_before_action :authenticate_employee!, only: %i[home payment]
  def home
  end

  def payment
    @table = Restaurant.tables.first # Order.find(session[:order]["id"])
  end
end
