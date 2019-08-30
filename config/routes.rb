Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
devise_for :users

  root to: 'users#dashboard'

  get 'home', to: 'pages#home'
  get 'dashboard', to: 'users#dashboard'
  get 'archives', to: 'users#archives'

  resources :users

  resources :lists, only: [:index, :show, :new, :create, :destroy] do
    resources :tasks, only: [:create, :destroy, :edit, :update]
    post 'tasks/:id', to: 'tasks#complete', as: 'task_complete'
  end
end
