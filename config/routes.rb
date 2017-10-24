Rails.application.routes.draw do
  # root      :to => "ideas#index"
  root "welcome#index"
  resources :users, only: [:new, :create, :show]

  resources :categories do
    resources :ideas
  end

  delete '/logout', :to => 'sessions#destroy'
  get    '/login',  :to => 'sessions#new'
  post   '/login',  :to => 'sessions#create'
end
