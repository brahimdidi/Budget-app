Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do 
    resources :groups
    resources :expenses
  end
  # Defines the root path route ("/")
  post 'users/:user_id/groups/new', :to => 'groups#create'
  authenticated :user do
    root 'groups#index', as: :root #-> if user is logged in
  end

  unauthenticated :user do
    root 'home#static', as: :unauthenticated #-> if user is not logged in
  end
end
