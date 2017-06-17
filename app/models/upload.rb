class Upload < ApplicationRecord
  include JsonUtil

  belongs_to :user
  has_one :track, as: :media, dependent: :destroy

  attr_accessor :tracks

  # has_attached_file :audio

end
