class FriendshipSerializer < ActiveModel::Serializer
  attributes :id, :friend_a, :friend_b

  def friend_a
    object.friend_a
  end

  def friend_b
    object.friend_b
  end

end
