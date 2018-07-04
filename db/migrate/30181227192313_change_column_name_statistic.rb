class ChangeColumnNameStatistic < ActiveRecord::Migration[5.2]
  def change
    rename_column :statistics, :type, :stat_type
  end
end
