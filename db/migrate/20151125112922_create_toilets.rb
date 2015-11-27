class CreateToilets < ActiveRecord::Migration
  def change
    create_table :toilets do |t|
      t.decimal :latitude, null: false
      t.decimal :longitude, null: false
      t.string :location
      t.integer :num_stalls
      t.boolean :has_hooks
      t.boolean :has_mirrors
      t.boolean :has_change_tables
      t.integer :toilet_paper
      t.integer :door_gap
      t.timestamps
    end
  end
end
