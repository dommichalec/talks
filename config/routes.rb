Rails.application.routes.draw do
  root "talks#index"
  
  resources :talks do
    resources :registrations
  end
end
