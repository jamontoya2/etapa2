Rails.application.routes.draw do
   root "demo#index"
  
  match ':controller(/:action(/:id))(.:format)' , via: [:post, :get]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
