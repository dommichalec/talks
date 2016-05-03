Rails.application.routes.draw do
  root "talks#index"
  resources :talks
end
