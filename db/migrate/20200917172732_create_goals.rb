class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :title
      t.date :deadline
      t.boolean :private
      t.boolean :multi_user

      t.timestamps
    end
  end
end
