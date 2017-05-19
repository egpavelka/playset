class Upload < ApplicationRecord
  belongs_to :user
  has_one :track, as: :media

  # has_attached_file :audio

end
