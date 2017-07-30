class Like < ApplicationRecord
  belongs_to :user, inverse_of: :likes
  belongs_to :likable, polymorphic: true

  validates :user_id, uniqueness: {
    scope: [:likable_id, :likable_type]
  }
end
