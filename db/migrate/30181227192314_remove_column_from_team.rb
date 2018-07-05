class RemoveColumnFromTeam < ActiveRecord::Migration[5.2]
  def change
    remove_reference :teams, :created_by
  end
end
