class Upload < ApplicationRecord

  has_one :track, as: :media
  validates :file_src, presence: true
  has_attached_file :audio
  #, :styles => lambda { |attachment| {m4a}}



  def upload_successful?
  end

end
