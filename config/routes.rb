Rails.application.routes.draw do
  resources :listings
  root "pages#about"
  get "contact" => "pages#contact"


end
