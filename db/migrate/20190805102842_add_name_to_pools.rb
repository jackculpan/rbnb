class AddNameToPools < ActiveRecord::Migration[5.2]
  def change
    add_column :pools, :name, :string
  end
end
