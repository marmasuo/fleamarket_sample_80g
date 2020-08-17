Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
  end
  root 'items#index'

  resources :cards, only: [:new, :create, :show, :destroy]

  resources :items do
    member do
      post 'purchase'
      get 'purchased'
      get 'buy'
    end
  end
    

end
