Rails.application.routes.draw do
  
  root 'players#index'

  get 'players/info', to: 'players#info'
  resources :players
  
end
