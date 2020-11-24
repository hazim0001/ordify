Rails.application.routes.draw do
  devise_for :employees
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_scope :employee do
    root to: 'pages#home'
  end

  resources :restaurants, except: %i[new create index destroy show edit update] do
    resources :tables, only: %i[create index show]
    resources :menu_items, only: %i[create edit update new]
  end

  resources :categories, only: %i[create index] do
    resources :menu_items, only: :index
  end

  resources :tables, except: %i[new create index destroy show edit update] do
    resources :orders, only: %i[new create]
  end

  resources :orders, only: :index do
    resources :line_items, only: %i[create index update]
  end

  resources :menu_items, only: %i[destroy show]
  resources :tables, only: :destroy
  resources :categories, only: :destroy
  resources :line_items, only: :destroy
end
