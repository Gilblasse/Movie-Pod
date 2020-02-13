class RenameColumnTypeToProperties < ActiveRecord::Migration[6.0]
  def change
    rename_column :properties, :type, :classification
  end
end
