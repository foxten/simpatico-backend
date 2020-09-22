class Goal < ApplicationRecord
    has_many :user_group_goals
    has_many :users, through: :user_group_goals
    has_many :markers, through: :user_group_goals
end
