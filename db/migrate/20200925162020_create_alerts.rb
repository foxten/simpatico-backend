class CreateAlerts < ActiveRecord::Migration[6.0]
  def change
    create_table :alerts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :message
      t.integer :alertable_id
      t.string :alertable_type

      t.timestamps
    end
  end
end
