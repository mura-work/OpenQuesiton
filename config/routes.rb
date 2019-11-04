Rails.application.routes.draw do
  get 'home/top'
  get 'home/about'
  get 'favorites/_favorite'
  root 'home#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :people
  resources :genres
  resources :users
  resources :books do
    resource :book_comments, only: [:create, :destroy, :edit, :update]
    resource :favorites, only: [:create, :destroy]
    collection do
      match 'search' => 'books#search', via: [:get, :post]
    end
  end

  post   '/favorites/:book_id' => 'favorites#create',   as: 'favorite'
  delete '/favorites/:book_id' => 'favorites#destroy', as: 'destroy'
end
