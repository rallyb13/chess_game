class DropPlayer < ActiveRecord::Migration
  def change
    drop_table :players

    remove_column :pieces, :player_id

    add_column :pieces, :white, :boolean
    add_column :pieces, :game_id, :integer
  end
end
