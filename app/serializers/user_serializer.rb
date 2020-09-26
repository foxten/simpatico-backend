class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :email_address, :password_digest, :mygoals, :friends, :friend_requests
  has_many :alerts

  def mygoals
    info = []
    object.user_group_goals.each {|goal|
      all_goal_info = Hash.new
      all_goal_info['ugg_id'] = goal.id
      all_goal_info["goal"] = goal.goal
      all_goal_info["markers"] = goal.markers
      all_goal_info["comp"] = goal.goal.users.select{|user| user.id != object.id}
      info << all_goal_info
    }
    info
  end
end
