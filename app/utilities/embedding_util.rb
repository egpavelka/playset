module EmbeddingUtil
  def self.valid_bandcamp_format
    /^https?:\/\/[^#\&\?\/\s]*\.bandcamp\.com\/track\/[^#\&\?\/\s]*$/i
  end
  def self.valid_soundcloud_format
    /^(https?:\/\/)?(www.|m\.)?soundcloud\.com\/[\w\-\.]+\/[\w\-\.]+$/i
  end
  def self.valid_spotify_format
    /^(spotify:track:|https?:\/\/[a-z]+\.spotify\.com\/track\/)([^#\&\?\/]*)$/i
  end
  def self.valid_vimeo_format
    /^https?:\/\/vimeo\.com\/+([^#\&\?\/]*)/i
  end
  def self.valid_youtube_format
    /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*)$/i
  end

  def self.supported_sources
    Hash[
      valid_bandcamp_format => 'Bandcamp',
      valid_soundcloud_format => 'Soundcloud',
      valid_spotify_format => 'Spotify',
      VALID_VIMEO_FORMAT => 'Vimeo',
      valid_youtube_format => 'Youtube'
    ]
  end

end
