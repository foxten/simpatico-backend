class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.references :friend_a
      t.references :friend_b
      
      t.timestamps
    end
  end
end
