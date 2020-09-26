class Friendship < ApplicationRecord
    belongs_to :friend_a, :class_name => "User"
    belongs_to :friend_b, :class_name => "User"
    has_many :alerts, as: :alertable

end
