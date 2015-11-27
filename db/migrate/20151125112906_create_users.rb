class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, uniqueness: true
      t.string :password_hash
      t.string :timestamps
    end
  end
end
