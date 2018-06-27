class AddIndexToPlayerTeamR < ActiveRecord::Migration[5.2]
  def change
    add_index :player_team_rs, [:user_id, :team_id], unique: true
  end
end
