Rails.application.routes.draw do
  resources :people, only: [:index, :create, :update, :show, :destroy]
  resources :animals, only: [:index, :create, :update, :show, :destroy]
end
