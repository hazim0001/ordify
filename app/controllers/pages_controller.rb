class PagesController < ApplicationController
  skip_before_action :authenticate_employee!, only: %i[home payment]
  def home
  end

  def payment
    # sleep(5)
    # redirect_to new_table_order_url(@order.table)
  end
end
