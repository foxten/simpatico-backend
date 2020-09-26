class Alert < ApplicationRecord
  belongs_to :user
  belongs_to :alertable, polymorphic: true
end
