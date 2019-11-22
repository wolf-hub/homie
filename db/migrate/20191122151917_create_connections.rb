class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.references :property, foreign_key: true
      t.references :request, foreign_key: true

      t.timestamps
    end
  end
end
