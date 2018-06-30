class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.datetime :scheduled_date
      t.string :where
      t.references :team_a, index: true, foreign_key: { to_table: :teams }
      t.references :team_b, index: true, foreign_key: { to_table: :teams }
      t.string :format

      t.timestamps
    end
  end
end

