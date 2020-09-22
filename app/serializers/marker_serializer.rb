class MarkerSerializer < ActiveModel::Serializer
  attributes :id, :title, :notes, :accomplished
  has_one :user_group_goal
end
