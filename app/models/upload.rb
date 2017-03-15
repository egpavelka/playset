class Upload < ApplicationRecord
  has_one :media_source, as: :media
  has_one :track, through: :media_source
  # validates :file_source, presence: true
  # has_attached_file :audio
  #, :styles => lambda { |attachment| {m4a}}



  def upload_successful?
  end

end
