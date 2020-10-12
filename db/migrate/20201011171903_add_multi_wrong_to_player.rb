class AddMultiWrongToPlayer < ActiveRecord::Migration[6.0]
  def self.up
    add_column :players, :multi_wrong, :text
  end

  def self.down
    remove_column :players, :multi_wrong
  end
end
