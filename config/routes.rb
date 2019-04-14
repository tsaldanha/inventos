Rails.application.routes.draw do
  
  devise_for :customers
  
  resources :product, only: [:index, :show]
  resources :cart, only: [:index]
  
  post 'cart/item/:id(.:format)', :to => 'cart#add_item', :as => :cart_item
  delete 'cart/item/:id(.:format)', :to => 'cart#delete_item'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'product#index'
end
