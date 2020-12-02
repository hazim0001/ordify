RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :employee
  end
  config.current_user_method(&:current_employee)

  config.included_models = [ "MenuItem", "LineItem", "Employee", "Category", "Table", "Order", "Restaurant", "ActiveStroge" ]

  config.authorize_with do
    unless current_employee.admin?
      flash[:alert] = 'Sorry, no admin access for you.'
      redirect_to main_app.root_path
    end
  end

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory

    index do
      except Restaurant
    end                         # mandatory

    new do
      except [Restaurant, Cusine, Order ]
    end
    export
    # bulk_delete
    show do
      except [Restaurant, LineItem, Category]
    end
    edit do
      except [Restaurant, Employee]
    end
    delete do
      except [Restaurant, Category, LineItem, Employee]
    end
    show_in_app do
      except [Restaurant, LineItem, Category, Order, Table]
    end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
