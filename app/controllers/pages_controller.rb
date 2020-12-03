class PagesController < ApplicationController
  skip_before_action :authenticate_employee!, only: :home
  def home
  end

  def payment
  end
end
