Rails.application.routes.draw do
  root 'talks#index'

  get 'signup', to: 'users#new'

  resources :categories
  resource :session
  resources :users

  resources :talks do
    resources :registrations
    resources :likes
  end
end
