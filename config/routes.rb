Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :groups
  # Defines the root path route ("/")
  root 'users#index'
end
