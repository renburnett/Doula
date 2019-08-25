Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :registry_types
  resources :service_categories
  resources :registries, param: :slug

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_for :affiliates, controllers: {
    sessions: 'affiliates/sessions'
  }

  #Root page 
  root to: "services#index"

  resources :services
  get '/articles/:article' => "articles#show"
  # get ':page' => "pages#show" 

  get 'search', to: 'registries#search_by_name'

  post '/add_to_registry/:service_id' => 'registries#add_service', as: :add_to_registry

end
