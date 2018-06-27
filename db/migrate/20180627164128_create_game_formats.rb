class CreateGameFormats < ActiveRecord::Migration[5.2]
  def change
    create_table :game_formats do |t|
      t.string :name
      t.integer :min_players
      t.integer :max_players
      t.integer :half_time

      t.timestamps
    end

    add_index :game_formats, :name

    GameFormat.create name: "6v6 Futsal", min_players: 5, max_players: 6, half_time: 20
    GameFormat.create name: "6v6 Casual", min_players: 5, max_players: 7, half_time: 7
    GameFormat.create name: "11v11 Field", min_players: 9, max_players: 11, half_time: 30
    GameFormat.create name: "11v11 Casual", min_players: 7, max_players: 11, half_time: 15
  end
end
