class AddUserToGames < ActiveRecord::Migration[5.2]
  def change
    add_reference :games, :game_master, foreign_key: { to_table: :users }
  end
end
