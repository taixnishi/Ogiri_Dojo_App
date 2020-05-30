Rails.application.routes.draw do
  
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users
  # home_action
  root "home#top"
  # themes_action
  resources :users, only: [:show]
  resources :themes do
    resource :likes, only: [:create, :destroy]
    resources :answers, only: [:create,:destroy] do
      resource :favorites, only: [:create, :destroy]
    end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
