class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :sku
      t.string :name
      t.string :description
      t.string :price
      t.string :photo
      t.string :category

      t.timestamps
    end
  end
end
