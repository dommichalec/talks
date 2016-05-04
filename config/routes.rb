Rails.application.routes.draw do
  resources :users
  root "talks#index"
  
  resources :talks do
    resources :registrations
  end
end
