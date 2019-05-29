class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :property_name
      t.integer :price
      t.string :home_type
      t.string :room_type
      t.integer :accommodate
      t.integer :bed_room
      t.integer :bath_room
      t.boolean :is_air
      t.boolean :is_parking
      t.boolean :is_washer
      t.boolean :is_balcony
      t.boolean :is_fireplace
      t.boolean :is_internet
      t.boolean :is_gym
      t.boolean :is_pool
      t.boolean :is_dogs
      t.boolean :is_cats
      t.boolean :is_wheelchair
      t.boolean :is_smoking
      t.string :address
      t.string :minimum_lease
      t.text :summary
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
