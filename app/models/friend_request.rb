class FriendRequest < ApplicationRecord
    belongs_to :requestor, class_name: :User
    belongs_to :requestee, class_name: :User
    has_many :alerts, as: :alertable
end
