Rails.application.routes.draw do
  resources :stats

  root "stats#index"
  post 'auth/steam/callback' => 'auth#auth_callback'
  get 'logout' => 'auth#logout'
end
