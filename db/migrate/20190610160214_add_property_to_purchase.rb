class AddPropertyToPurchase < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :property_id, :integer
  end
end
