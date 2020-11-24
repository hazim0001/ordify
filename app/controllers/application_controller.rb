class ApplicationController < ActionController::Base
  before_action :authenticate_employee!
end
