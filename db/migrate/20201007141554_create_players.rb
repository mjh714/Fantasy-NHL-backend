class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :full_name
      t.string :current_team_name
      t.string :primary_position_name
      t.integer :primary_number
      t.string :shoots_catches
      t.date :birth_date
      t.string :nationality
      t.string :height
      t.integer :weight
      t.string :image
      t.timestamps
    end
  end
end
