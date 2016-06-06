Rails.application.routes.draw do
  resources :stats
  resources :search

  root "stats#index"
  post 'auth/steam/callback' => 'auth#auth_callback'
  get 'logout' => 'auth#logout'
  get '*no_steam', to: 'errors#steam_down'
end
