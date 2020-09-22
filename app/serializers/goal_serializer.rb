class GoalSerializer < ActiveModel::Serializer
  attributes :id, :title, :deadline, :private, :multi_user
end
