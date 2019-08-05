class CreatePools < ActiveRecord::Migration[5.2]
  def change
    create_table :pools do |t|
      t.text :location
      t.integer :price
      t.integer :number_of_people
      t.text :description
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
