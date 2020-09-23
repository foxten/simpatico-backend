class GoalSerializer < ActiveModel::Serializer
  attributes :goal
  # attributes :id, :title, :deadline, :publicly_viewable, :multi_user, :user_group_goals, :markers

  def goal
    details = []
    object.user_group_goals.each { |ugg|
      info = Hash.new
      info['ugg_id'] = ugg.id
      info['goal'] = object
      info['markers'] = ugg.markers
      info['comp'] = object.users.select{|user| user.id != ugg.user_id}
      details << info
    }
    details
  end
end


# { ugg_id: 31, {goal}, [{markers}], [comp] }