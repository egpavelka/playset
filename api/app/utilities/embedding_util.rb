module EmbeddingUtil
  def valid_bandcamp_format
    /^https?:\/\/[^#\&\?\/\s]*\.bandcamp\.com\/track\/[^#\&\?\/\s]*$/i
  end
  def valid_soundcloud_format
    /^(https?:\/\/)?(www.|m\.)?soundcloud\.com\/[\w\-\.]+\/[\w\-\.]+$/i
  end
  def valid_spotify_format
    /^(spotify:track:|https?:\/\/[a-z]+\.spotify\.com\/track\/)([^#\&\?\/]*)$/i
  end
  def valid_vimeo_format
    /^https?:\/\/vimeo\.com\/+([^#\&\?\/]*)/i
  end
  def valid_youtube_format
    /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*)$/i
  end

  def supported_sources
    Hash[
      valid_bandcamp_format => 'Bandcamp',
      valid_soundcloud_format => 'Soundcloud',
      valid_spotify_format => 'Spotify',
      valid_vimeo_format => 'Vimeo',
      valid_youtube_format => 'Youtube'
    ]
  end

  def self.set_service(url)
    url_source = supported_sources.keys.detect { |valid_format| url.match(valid_format) }
    if url_source
      return supported_sources.fetch(url_source)
    else
      errors.add(:base, "The URL could not be matched to a track from a supported source.")
    end
  end

end
