class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :goals, :private, :publicly_viewable
  end
end
