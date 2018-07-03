class CreateStatistics < ActiveRecord::Migration[5.2]
  def change
    create_table :statistics do |t|
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true
      t.integer :total, default: 1, null: false
      t.string :type

      t.timestamps
    end
  end
end
