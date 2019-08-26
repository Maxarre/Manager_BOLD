Rails.application.routes.draw do
  get 'tasks/index'
  get 'tasks/show'
  get 'tasks/new'
  get 'tasks/edit'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  get 'lists/index'
  get 'lists/show'
  get 'lists/new'
  get 'lists/edit'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
