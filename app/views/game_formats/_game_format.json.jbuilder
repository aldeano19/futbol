json.extract! game_format, :id, :name, :min_players, :max_players, :half_time, :created_at, :updated_at
json.url game_format_url(game_format, format: :json)
