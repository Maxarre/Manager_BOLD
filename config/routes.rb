Rails.application.routes.draw do
devise_for :users

  root to: 'users#dashboard'

  get 'home', to: 'pages#home'
  get 'dashboard', to: 'users#dashboard'

  resources :users

  resources :lists, only: [:index, :show, :new, :create, :destroy] do
    resources :tasks, only: [:create, :destroy]
  end
end
