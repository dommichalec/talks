Rails.application.routes.draw do
  get 'signup', to: 'users#new'
  resources :users
  root 'talks#index'
  resources :talks do
    resources :registrations
  end
end
