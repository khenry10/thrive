Rails.application.routes.draw do

  root to: 'lists#index'

  resources :lists do
    resources :tasks
      member do
        put 'completed_task'
      end
  end

  resources :tasks, only: [:index]

end
