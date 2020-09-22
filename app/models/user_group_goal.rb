class UserGroupGoal < ApplicationRecord
  belongs_to :user
  belongs_to :goal
  has_many :markers
end
