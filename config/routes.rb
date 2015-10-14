Rails.application.routes.draw do
  
  devise_for :users, path_names: {edit: 'profile'}
  resources :listings
  root "listings#index"
  get "about" => "pages#about"
  get "contact" => "pages#contact"


end
