Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :groups
  # Defines the root path route ("/")

  authenticated :user do
    root 'groups#index', as: :root #-> if user is logged in
    resources :controller #-> ONLY available for logged in users
  end

  unauthenticated :user do
    root 'home#static', as: :unauthenticated #-> if user is not logged in
  end
end
