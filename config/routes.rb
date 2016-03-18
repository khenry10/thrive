Rails.application.routes.draw do

  root to: 'lists#index'

  resources :tasks
  resources :lists

end
