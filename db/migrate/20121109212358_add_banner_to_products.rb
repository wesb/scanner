class AddBannerToProducts < ActiveRecord::Migration
  def change
    add_column :products, :banner, :string
  end
end
