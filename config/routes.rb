Rails.application.routes.draw do
  
  devise_for :customers
  
  resources :product, only: [:index, :show]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'product#index'
end
