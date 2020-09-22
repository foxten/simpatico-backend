class FriendRequestSerializer < ActiveModel::Serializer
  attributes :id, :requestor_id, :requestee_id
end
