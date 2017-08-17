class Embedded::Youtube

  def get_data(url)
    # API parameters from input url
    @video_id = url.match.(VALID_YT_FORMAT).captures[1]
      # First match group will be 'watch?v=' or '&v='
      # Second match group will be video ID
    video = Yt::Video.new id: @video_id
    Hash[
      :title => video.title,
      :description => video.description
    ]
  end

  def set_metadata(data)
    Hash[
    :title => nil,
    :artist => nil,
    :album => nil,
    :year => nil,
    :album_art => file_from_url("https://img.youtube.com/vi/#{@video_id}/hqdefault.jpg"),
    :media_path => self.player_url,
    :hint => data
  end

  # Generate url with options for iframe
  def player_url
    "https://www.youtube.com/embed/#{@video_id}?enablejsapi=1&color=white&controls=0&playsinline=1&showinfo=0&rel=0"
  end

  # Verify
  def matches_link?
  end

  def is_track?
    h, m, s = length.split(':').map{ |n| n.to_i }
    duration = h*3600 + m*60 + s
    public? && duration <= 1200
  end

end
