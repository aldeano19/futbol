Rails.application.routes.draw do
  resources :game_formats
  resources :games
  resources :teams
  devise_for :users

  root "pages#index"

  post "add_player" => "teams#add_player"
end
