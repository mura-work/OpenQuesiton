Rails.application.routes.draw do
  root 'home#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :people, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :genres, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :books do
  	resource :book_comments, only: [:create, :destroy]
  end
  resources :users
end
