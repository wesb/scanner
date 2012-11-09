class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.integer :customer_id
      t.integer :store_id

      t.timestamps
    end
  end
end
