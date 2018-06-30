class RenameWhenColumnInGame < ActiveRecord::Migration[5.2]
  def change
    rename_column :games, :scheduled_date, :scheduled_date
  end
end
