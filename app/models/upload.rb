class Upload < ApplicationRecord
  include DataGrabUtil

  belongs_to :user
  has_one :track, as: :media, dependent: :destroy

  attr_accessor :tracks

  # has_attached_file :audio

end
