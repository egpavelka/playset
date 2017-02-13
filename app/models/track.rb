class Track < ApplicationRecord
  belongs_to :user
  has_many :likes
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :url_src, presence: true
end
