Rails.application.routes.draw do
  
resources :articulos do
	resources :comentarios
end	
  root 'bienvenido#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
