class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.integer :num_guest
      t.integer :service_fee
      t.integer :status
      t.references :guest, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true
      t.references :review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
