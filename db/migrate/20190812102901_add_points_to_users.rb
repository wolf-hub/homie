class AddPointsToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :freepoints, :integer, default: 5
  end
end
