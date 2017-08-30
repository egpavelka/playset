# Methods available to multiple classes for handling data from external sources.

module VideoMetadataUtil
  attr_accessor :video

  def initialize(video)
    @video = video
  end

  def perform
    clean_title
  end

  def clean_title
    extraneous_info.each do |blah|
      @video.title.gsub!(blah, '')
    end
    @video.title.strip!
  end

  def parse_title
    title.include?(" - ") ? title.split(" - ", 2) : ['', '']
  end

  def find_year
    year_pattern = /[\[\(]([\d]{4})[\]\)]/  # [XXXX], (XXXX)
    alt_year_pattern = /\(c\)\s?([\d]{4})/i  # (C) XXXX
    if title.match(year_pattern)
      year = title.match(year_pattern)[1]
      title.gsub!(title.match(year_pattern)[0], '').strip!
    elsif description.match(alt_pattern)
      year = description.match(alt_pattern)[1]
    end
    return year
  end

  def find_album
    album_pattern = /album\s\"(.*)\"/i
    if description.match(album_pattern)
      @video_metadata.album = description.match(album_pattern)[1]
    end
  end

  def is_track
    return false if title.match(/[\[\(]full album[\]\)]/)
    h, m, s = length.split(':').map{ |n| n.to_i }
    duration = h*3600 + m*60 + s
    duration <= 1200
  end

private
  def extraneous_info
    extraneous_phrases = ['audio', 'audio only', 'full song', 'lyric video', 'lyrics', 'lyrics on screen', 'new song', 'new video', 'official', 'official audio', 'official music video', 'official song', 'official video', 'with lyrics', 'w/ lyrics']

    arr = Array.new
    extraneous_phrases.each do |phrase|
      arr << Regexp.new(Regexp.quote("[#{phrase}]"), Regexp::IGNORECASE)
      arr << Regexp.new(Regexp.quote("(#{phrase})"), Regexp::IGNORECASE)
    end
    return arr
  end
end
