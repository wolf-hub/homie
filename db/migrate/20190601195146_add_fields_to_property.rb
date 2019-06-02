class AddFieldsToProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :latitude, :float
    add_column :properties, :longitude, :float
  end
end
