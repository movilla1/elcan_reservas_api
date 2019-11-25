Rails.application.routes.draw do
  resources :venta
  resources :proveedores
  resources :articulos
  resources :reservas
  resources :cajas
  resources :clientes
  resources :canchas
  resources :horarios
  post "login", to: "authentication#authenticate"
end
