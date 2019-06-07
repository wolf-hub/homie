class AddAddressToLandlords < ActiveRecord::Migration[5.2]
  def change
    add_column :landlords, :address, :string
  end
end
