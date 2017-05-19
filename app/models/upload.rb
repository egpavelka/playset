class Upload < ApplicationRecord
  belongs_to :user
  has_one :track, as: :media

  attr_accessor :tracks

  # has_attached_file :audio

end
