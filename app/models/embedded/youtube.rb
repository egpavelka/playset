require 'yt'

class Embedded::Youtube
  include VideoMetadataUtil
  attr_accessor :video

  def get_data(url)
    # API parameters from input url
    @video.id = url.match(Embedded::VALID_YOUTUBE_FORMAT)[2]
      # First match group will be 'watch?v=' or '&v='
      # Second match group will be video ID
    yt_object = Yt::Video.new id: @video_id
    # video = Hash[
    #   :title => yt_object.title,
    #   :hint => {
    #     :title_hint => yt_object.title,
    #     :description_hint => yt_object.description
    #   }
    # ]
    @video.title = yt_object.title
    vid
    @video.clean_title
    @video['year'] = video.find_year
    return @video
  end

  def set_metadata(data)
    Hash[
    :title => data.parse_title[1],
    :artist => data.parse_title[0],
    :album => data.find_album,
    :year => data.year,
    :album_art => file_from_url("https://img.youtube.com/vi/#{@video.id}/hqdefault.jpg"),
    :media_path => self.player_url,
    :hint => data.hint
  ]
  end

  # Verify
  def is_track?
    category_title == 'Music' && public?
  end

  private

  # Generate url with options for iframe
  def player_url
    "https://www.youtube.com/embed/#{@video.id}?enablejsapi=1&color=white&controls=0&playsinline=1&showinfo=0&rel=0"
  end

end
