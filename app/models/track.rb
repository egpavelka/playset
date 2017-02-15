class Track < ApplicationRecord
  belongs_to :user
  has_many :likes #, numericality: true
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true
  validates :artist, presence: true
  validates :year, length: { is: 4 }

  def check_src_type
    if url_src
      if "youtube.com/watch?v=".in? url_src
        src_type = 'youtube'
      elsif "soundcloud.com/".in? url_src
        src_type = 'soundcloud'
      elsif "spotify.com/".in? url_src
        src_type = 'spotify'
      else
        flash[:danger] = title_error
        render 'new'
      end
    else
      if file_src.upload_successful?
        src_type = 'local'
      else
        render 'new'
      end
    end
  end

  def upload_successful?
  end

  title_error = "Please enter a valid link to a single Soundcloud or Spotify track or a YouTube video."


end
