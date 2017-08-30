module EmbeddingUtil
  VALID_BANDCAMP_FORMAT = /^https?:\/\/[^#\&\?\/\s]*\.bandcamp\.com\/track\/[^#\&\?\/\s]*$/i
  VALID_SOUNDCLOUD_FORMAT = /^(https?:\/\/)?(www.|m\.)?soundcloud\.com\/[\w\-\.]+\/[\w\-\.]+$/i
  VALID_SPOTIFY_FORMAT = /^(spotify:track:|https?:\/\/[a-z]+\.spotify\.com\/track\/)([^#\&\?\/]*)$/i
  VALID_VIMEO_FORMAT = /^https?:\/\/vimeo\.com\/+([^#\&\?\/]*)/i
  VALID_YOUTUBE_FORMAT = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*)$/i

  def supported_sources
    Hash[
      VALID_BANDCAMP_FORMAT => 'Bandcamp',
      VALID_SOUNDCLOUD_FORMAT => 'Soundcloud', # Soundcloud gem uses "Soundcloud"
      VALID_SPOTIFY_FORMAT => 'Spotify',
      VALID_VIMEO_FORMAT => 'Vimeo',
      VALID_YOUTUBE_FORMAT => 'Youtube'
    ]
  end

end
