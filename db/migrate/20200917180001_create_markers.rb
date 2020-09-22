class CreateMarkers < ActiveRecord::Migration[6.0]
  def change
    create_table :markers do |t|
      t.string :title
      t.text :notes
      t.boolean :accomplished
      t.references :user_group_goal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
