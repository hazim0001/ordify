class PagesController < ApplicationController
  skip_before_action :authenticate_employee!, only: %i[home payment]
  def home
  end
end
