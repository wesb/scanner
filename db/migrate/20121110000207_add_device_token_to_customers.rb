class AddDeviceTokenToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :device_token, :string
  end
end
