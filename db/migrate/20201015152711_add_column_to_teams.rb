class AddColumnToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :num_of_points, :integer, :default => 0
  end
end
