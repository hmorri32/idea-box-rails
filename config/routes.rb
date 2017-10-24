Rails.application.routes.draw do
  # root      :to => "ideas#index"
  root "welcome#index"
  resources :users, only: [:new, :create, :show]

  resources :categories do
    resources :ideas
  end

  get    '/login',  :to => 'sessions#new'
  post   '/login',  :to => 'sessions#create'
  delete '/logout', :to => 'sessions#destroy'
end
