Rails.application.routes.draw do
  resources :registrations
  root "talks#index"
  resources :talks
end
