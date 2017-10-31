Rails.application.routes.draw do
  # root      :to => "ideas#index"
  root "welcome#index"

  resources :users, only: [:new, :create, :show] { resources :ideas }
  resources :categories, only: [:index, :show]

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :categories
    resources :images
  end
end
