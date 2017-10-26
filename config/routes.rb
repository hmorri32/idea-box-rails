Rails.application.routes.draw do
  # root      :to => "ideas#index"
  root "welcome#index"
  # TODO REROUTE AND RETEST
  resources :users, only: [:new, :create, :show] # do
    #resources :ideas
  #end

  resources :categories do
    resources :ideas
  end

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :categories
    resources :images
  end
end
