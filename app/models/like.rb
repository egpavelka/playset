class Like < ApplicationRecord
  belongs_to :user, inverse_of: :likes
  belongs_to :likeable, polymorphic: true


  validates :user_id, uniqueness: {
    scope: [:likeable_id, :likeable_type]
  }

end
