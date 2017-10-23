Rails.application.routes.draw do
  root      :to => "ideas#index"
  resources :categories do
    resources :ideas
  end
end
