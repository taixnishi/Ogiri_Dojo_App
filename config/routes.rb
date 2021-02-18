Rails.application.routes.draw do
  root "themes#index"
  # get 'likes/create'
  # get 'likes/destroy'

  devise_for :users

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  resources :users, only: [:show]
  resources :themes do
    resource :likes, only: [:create, :destroy]
    resources :answers, only: [:create,:destroy] do
      resource :favorites, only: [:create, :destroy]
    end
end

end
