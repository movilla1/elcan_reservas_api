Rails.application.routes.draw do
  resources :reservas
  resources :cajas
  resources :clientes
  resources :canchas
  resources :horarios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'login', to: 'authentication#authenticate'
end
