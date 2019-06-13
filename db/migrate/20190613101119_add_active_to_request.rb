class AddActiveToRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :active, :boolean
  end
end
