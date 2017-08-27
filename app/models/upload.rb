class Upload < ApplicationRecord
  include DataGrabUtil

  belongs_to :user
  has_one :track_source, as: :media
  has_one :track, through: :track_sources

  # has_attached_file :audio
end
