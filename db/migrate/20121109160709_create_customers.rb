class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :card_number
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
