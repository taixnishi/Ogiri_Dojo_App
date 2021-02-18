Rails.application.routes.draw do
  root "themes#index"

  devise_for :users, :controllers => {
    :registrations => 'devise/registrations',
    :sessions => 'devise/sessions',
   }

  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
    get "sign_out", :to => "devise/sessions#destroy" 
    post 'users/guest_sign_in', to: 'devise/sessions#new_guest'
  end
  
  resources :users, only: [:show]
  resources :themes do
    resource :likes, only: [:create, :destroy]
    resources :answers, only: [:create,:destroy] do
      resource :favorites, only: [:create, :destroy]
    end
end

  get 'likes/create'
  get 'likes/destroy'

end
