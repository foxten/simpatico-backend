class GoalSerializer < ActiveModel::Serializer
  attributes :id, :title, :deadline, :publicly_viewable, :multi_user
end
