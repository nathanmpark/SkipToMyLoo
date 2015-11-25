class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :stars, null: false
      t.text :review
      t.references :user
      t.references :toilet
      t.timestamps
    end
  end
end
