class UserGroupGoalSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :goal
end
