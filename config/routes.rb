Rails.application.routes.draw do
  
  
  devise_for :users, path_names: {edit: 'profile'}
  resources :listings do
  	resources :orders, only: [:new, :create]
  end
  root "listings#index"
  get "about" => "pages#about"
  get "contact" => "pages#contact"

  get "seller" => "listings#seller"
  get "sales" => "orders#sales"
  get "purchases" => "orders#purchases"
end
