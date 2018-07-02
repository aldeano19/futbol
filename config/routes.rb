Rails.application.routes.draw do
  resources :game_formats
  resources :games
  resources :teams
  devise_for :users, controllers: { registrations: "registrations" }

  root "pages#index"

  # get "search_players" => "teams#search_players"
  post "add_player" => "teams#add_player"
  delete "remove_player" => "teams#remove_player"
end
