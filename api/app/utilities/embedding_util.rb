module EmbeddingUtil
  @@valid_bandcamp_format = /^https?:\/\/[^#\&\?\/\s]*\.bandcamp\.com\/track\/[^#\&\?\/\s]*$/i
  @@valid_soundcloud_format = /^(https?:\/\/)?(www.|m\.)?soundcloud\.com\/[\w\-\.]+\/[\w\-\.]+$/i
  @@valid_spotify_format = /^(spotify:track:|https?:\/\/[a-z]+\.spotify\.com\/track\/)([^#\&\?\/]*)$/i
  @@valid_vimeo_format = /^https?:\/\/vimeo\.com\/+([^#\&\?\/]*)/i
  @@valid_youtube_format = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*)$/i

  @@supported_sources = {
    @@valid_bandcamp_format => 'Bandcamp',
    @@valid_soundcloud_format => 'Soundcloud',
    @@valid_spotify_format => 'Spotify',
    @@valid_vimeo_format => 'Vimeo',
    @@valid_youtube_format => 'Youtube'
  }
  
  def self.set_service(input_url)
    valid_url = @@supported_sources.keys.detect { |valid_format| input_url.match(valid_format) }
    if valid_url
      return @@supported_sources.fetch(valid_url)
    else
      errors.add(:base, "The URL could not be matched to a track from a supported source.")
    end
  end

end
