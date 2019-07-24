class ChangeColumnActiveInProperty < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :properties, :active, true
  end
end
