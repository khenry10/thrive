Rails.application.routes.draw do

  devise_for :views
  devise_for :users
  root to: 'lists#index'

  resources :lists do
    resources :tasks
    # JGZ - Cool! would love to understand how this is working?
      member do
        put 'completed_task'
      end
  end

  resources :tasks, only: [:index]

end
