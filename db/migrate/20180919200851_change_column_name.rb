class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :contents, :type, :data_type
  end
end
