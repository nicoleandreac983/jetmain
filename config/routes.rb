Rails.application.routes.draw do
  resources :maintenances
  get 'pages/inicio'
  get 'pages/terminos'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
end
