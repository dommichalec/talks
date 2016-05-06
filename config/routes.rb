Rails.application.routes.draw do
  resources :categories
  get 'signup', to: 'users#new'
  resource :session
  resources :users
  root 'talks#index'
  resources :talks do
    resources :registrations
    resources :likes
  end
end
