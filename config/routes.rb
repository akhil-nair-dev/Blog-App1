Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  
  resources :blogs do
  	resources :comments
  	member do
  		put "like" => "blogs#like"
  	end
  end
end
