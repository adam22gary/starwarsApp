Rails.application.routes.draw do
  resources :films
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "films#index"
end
