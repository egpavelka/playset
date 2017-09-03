require 'yt'

class YoutubeService
  include VideoMetadataUtil

  def get_data(url)
    # API parameters from input url
    @video_id = url.match(Embedded::valid_youtube_format)[2]
    video = Yt::Video.new id: @video_id
    Hash[
      :hint => {
        :title_hint => video.title,
        :description_hint => video.description
      },
      :title => video.title
    ]
    video.clean_title
    video['year'] = video.find_year
    return video
  end

  def set_metadata(data)
    Hash[
    :title => data.parse_title[1],
    :artist => data.parse_title[0],
    :album => data.find_album,
    :year => data.year,
    :album_art => file_from_url("https://img.youtube.com/vi/#{@video_id}/hqdefault.jpg"),
    :media_path => self.player_url,
    :hint => data.hint
  ]
  end

  # Verify
  def is_track?(data)
    data.category_title == 'Music' && data.public?
  end

  private

  # Generate url with options for iframe
  def player_url
    "https://www.youtube.com/embed/#{@video.id}?enablejsapi=1&color=white&controls=0&playsinline=1&showinfo=0&rel=0"
  end

end
