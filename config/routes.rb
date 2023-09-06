Rails.application.routes.draw do
  get 'pages/terminos', to: 'pages#terminos', as: 'pages_terminos'
  resources :maintenances
  resources :engines
  get 'pages/inicio', to: 'pages#inicio', as: 'pages_inicio'

  devise_for :users

  # Define la ruta de inicio después de iniciar sesión
  authenticated :user do
    root 'pages#inicio', as: :authenticated_root
  end
  
  # Define la ruta de inicio predeterminada para los no autenticados (inicio de sesión)
  root to: 'devise/sessions#new'
end


