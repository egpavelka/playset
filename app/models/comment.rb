class Comment < ApplicationRecord
  belongs_to :user, inverse_of: :comments
  belongs_to :commentable, polymorphic: true
  has_many :likes, as: :likable
end
