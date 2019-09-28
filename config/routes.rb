Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :people, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :genres, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :books
  resources :users
end
