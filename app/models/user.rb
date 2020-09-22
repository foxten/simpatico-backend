class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :email_address, uniqueness: true
    validates :password, length: {minimum: 6} 
    has_many :friend_requests, ->(u) {unscope(where: :user_id).where "requestor_id = ? or requestee_id = ?", u.id, u.id}
    has_many :friendships, ->(u) {unscope(where: :user_id).where "friend_a_id = ? or friend_b_id = ?", u.id, u.id}
    # has_many :friends, through: :friendships
    has_many :friend_as, through: :friendships, source: :friend_a
    has_many :friend_bs, through: :friendships, source: :friend_b
    has_many :user_group_goals
    has_many :goals, through: :user_group_goals

    def friends
        (friend_as + friend_bs).select{ |friend|
            friend.id != self.id
        }
    end
end

# has_many :friend_requests_as_requestor, foreign_key: :requestor_id, class_name: :FriendRequest
# has_many :friend_requests_as_requestee, foreign_key: :requestee_id, class_name: :FriendRequest
# has_many :friendships_as_friend_a, foreign_key: :friend_a, class_name: :Friendship
# has_many :friendships_as_friend_b, foreign_key: :friend_b, class_name: :Friendship