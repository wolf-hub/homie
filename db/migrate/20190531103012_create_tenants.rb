class CreateTenants < ActiveRecord::Migration[5.2]
  def change
    create_table :tenants do |t|
      t.string :first_name
      t.string :last_name
      t.text :information
      t.string :employment_status
      t.string :working_place
      t.integer :from_year
      t.integer :to_year
      t.integer :credit_score
      t.string :address
      t.string :phone_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
