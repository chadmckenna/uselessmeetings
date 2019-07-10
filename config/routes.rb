Rails.application.routes.draw do
  get 'home/index'

  resources :meetings, only: [:create, :show] do
    resources :reviews, only: [:new, :create]
  end

  root 'home#index'
end
