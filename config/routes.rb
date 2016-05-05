Rails.application.routes.draw do
  get 'signup', to: 'users#new'
  resource :session
  resources :users
  root 'talks#index'
  resources :talks do
    resources :registrations
  end
end
