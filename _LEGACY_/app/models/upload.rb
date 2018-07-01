class Upload < ApplicationRecord
  include DataGrabUtil

  belongs_to :user
  has_one :track, as: :media, dependent: :destroy

  # has_attached_file :audio
end
