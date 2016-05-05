Rails.application.routes.draw do
  resources :likes
  get 'signup', to: 'users#new'
  resource :session
  resources :users
  root 'talks#index'
  resources :talks do
    resources :registrations
  end
end
