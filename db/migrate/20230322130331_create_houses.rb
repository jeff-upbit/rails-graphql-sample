class CreateHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :houses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.string :price

      t.timestamps
    end
  end
end
