class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :title
      t.string :type
      t.text :description
      t.text :amenities
      t.integer :bathrooms
      t.integer :capacity
      t.text :rules
      t.integer :price
      t.text :allowed
      t.string :state
      t.string :city
      t.integer :cleaning_fee
      t.text :availability
      t.string :check_in
      t.string :check_out
      t.integer :bedrooms
      t.references :host, null: false, foreign_key: true

      t.timestamps
    end
  end
end
