class Upload < ApplicationRecord

  has_one :track, as: :media

  validates :file_src, presence: true

  def upload_successful?
  end

end
