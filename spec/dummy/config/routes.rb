Rails.application.routes.draw do
  resources :rate_limit, only: [:index]
end
