Rails.application.routes.draw do
  devise_for :employees

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  mount StripeEvent::Engine, at: '/stripe-webhooks'

  authenticate :employee, ->(employee) { employee.admin? } do
    mount Blazer::Engine, at: "blazer"
  end

  devise_scope :employee do
    root to: 'pages#home'
  end

  resources :restaurants, except: %i[new create index destroy show edit update] do
    resources :tables, only: %i[create index show]
    resources :menu_items, only: %i[create edit update new]
    resources :inventories , only: :index
    resources :ingredient_inventories, only: %i[index create ]
    resources :inventory_refills, only: :index
    resources :orders, only: %i[new create]
    member do
      get :dashboard
    end
  end

  resources :categories, only: %i[create index] do
    resources :menu_items, only: :index
  end

  resources :tables, except: %i[new create index destroy show edit update] do
    resources :orders, only: %i[new create]
  end

  resources :orders, only: %i[index update edit destroy] do
    resources :line_items, only: %i[create index update]
    member do
      post :dispatch_notify
      patch :shallow_delete
    end
    collection do
      get :display
    end
  end

  resources :menu_items, only: %i[destroy show]
  resources :tables, only: :destroy
  resources :categories, only: :destroy
  resources :ingredient_inventories, only: %i[update destroy]
  resources :inventory_refills, only: %i[create]

  resources :line_items, only: %i[destroy edit] do
    member do
      patch :shallow_delete
    end
  end

  get '/payment', to: 'pages#payment'

end
