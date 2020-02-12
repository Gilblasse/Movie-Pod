class CreateHosts < ActiveRecord::Migration[6.0]
  def change
    create_table :hosts do |t|
      t.string :city
      t.string :country
      t.text :bio
      t.integer :guest_profile_id
      t.boolean :super_host

      t.timestamps
    end
  end
end
