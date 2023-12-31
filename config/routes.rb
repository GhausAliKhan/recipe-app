Rails.application.routes.draw do
  # get 'public_recipes/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get 'shopping_list/recipe_id/:recipe_id/inventory_id/:inventory_id', to: 'shopping_lists#shopping_list', as: 'shopping_list'

  resources :inventories, only: [:index, :new, :show, :create, :update, :destroy] do
    resources :inventory_foods, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  resources :recipes do
    resources :recipe_foods
  end
  resources :foods
  root 'public_recipes#index'
end
