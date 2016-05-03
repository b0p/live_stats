Rails.application.routes.draw do
  root "stats#index"

  resources :stats
end
