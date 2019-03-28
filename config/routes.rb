Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'boards', to: 'boards#index'
  post 'boards/new', to: 'boards#new'
end

