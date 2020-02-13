class AddColumnToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :address, :string
    add_column :properties, :zip, :string
  end
end
