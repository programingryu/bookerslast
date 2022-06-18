Rails.application.routes.draw do
  root :to => 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'

  devise_for :users
  # devise_for :users, :controllers => {
  #   :registrations => 'devise/registrations'
  # }

  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
end