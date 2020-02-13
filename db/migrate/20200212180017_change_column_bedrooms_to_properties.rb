class ChangeColumnBedroomsToProperties < ActiveRecord::Migration[6.0]
  def change
    rename_column :properties, :bedrooms, :beds
  end
end
