class ApplicationController < ActionController::Base
  before_action :authenticate_employee!
  include Pundit

  # after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  def after_sign_in_path_for(resource)
    if resource.role == "cook"
      restaurant_tables_path(resource.restaurant)
    elsif resource.role == "manager" && resource.admin? == true
      # restaurant_inventories_path(resource.restaurant)
      rails_admin_path
    end
  end

  def after_sign_in_path_for(resource)
    if resource.role == "cook"
      restaurant_tables_path(resource.restaurant)
    elsif resource.role == "manager" && resource.admin? == true
      restaurant_inventories_path(resource.restaurant)
    end
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def pundit_user
    current_employee
  end
end
