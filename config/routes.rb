Rails.application.routes.draw do
  get 'mypage', to: 'users#new'
  post 'login', to:  'sessions#create'
  destroy 'logout', to:  'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :users, only: %i[new create]
  resources :boards
  resources :comments, only: %i[create edit update destroy]
end

