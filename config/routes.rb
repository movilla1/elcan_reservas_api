Rails.application.routes.draw do
  resources :compras
  resources :ventas
  resources :proveedores
  resources :articulos
  resources :reservas
  resources :cajas
  resources :clientes
  resources :canchas
  resources :horarios
  post "login", to: "authentication#authenticate"
end
