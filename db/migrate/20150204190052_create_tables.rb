class CreateTables < ActiveRecord::Migration
  def change
    create_table(:games) do |t|
      t.boolean :white_turn
      t.timestamps null: false
    end

    create_table(:players) do |t|
      t.boolean :white
      t.integer :game_id, index: true
      t.timestamps null: false
    end

    create_table(:pieces) do |t|
      t.integer :player_id, index: true
      t.integer :x, index: true
      t.integer :y, index: true
      t.string :type
      t.timestamps null: false

    end


  end
end
