class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :profile_id
      t.string :profile_type
      t.string :password_digest

      t.timestamps
    end
  end
end
