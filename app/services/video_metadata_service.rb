# Methods available to multiple classes for handling data from external sources.

class VideoMetadataService
  attr_accessor :video, :title, :autodata

  def initialize(params)
    @title = params[:title]
    @description = params[:description]
    @autodata = Hash.new
  end

  def perform
    clean_title
    find_year
    find_title_and_artist
    find_album
    return data_hash
  end

  def data_hash
    Hash[
      :hint => {
        title_hint: @title,
        description_hint: @description
      },
      :metadata => {
        title: @autodata[:title],
        artist: @autodata[:artist],
        album: @autodata[:album]
      },
      :year_params => [@autodata[:year], '%Y']
    ]
  end

  def clean_title
    garbage = extraneous_info
    extraneous_info.each do |blah|
      @title.gsub!(blah, '')
    end
    @title.strip!
  end

  def find_title_and_artist
    title_separators = [' - ', ' | ']
    title_separators.each do |pattern|
      unless @autodata[:title] || @autodata[:artist]
        @title.include?(pattern) ? parse_title(pattern) : nil
      end
    end
  end

  def parse_title(pattern)
    arr = @title.split(pattern, 2)
    if @description.include?('by ' + arr[1])
      @autodata[:artist] = arr[1]
      @autodata[:title] = arr[0]
    else
      @autodata[:artist] = arr[0]
      @autodata[:title] = arr[1]
    end
  end

  def find_year
    year_patterns = [ /[\[\(]([\d]{4})[\]\)]/, /\(c\)\s?([\d]{4})/i ] # [XXXX], (XXXX) # (C) XXXX
    year_patterns.each do |pattern|
      unless @autodata[:year]
        parse_year(pattern)
      end
    end
  end

  def parse_year(pattern)
    if @title.match(pattern)
      @autodata[:year] = title.match(pattern)[1]
      @title.gsub!(title.match(year_pattern)[0], '').strip!
    elsif @description.match(pattern)
      @autodata[:year] = @description.match(pattern)[1]
    end
  end

  def find_album
    album_patterns = [[/"([\w\s]+)"\s(album|Album|ALBUM|LP|EP)/, 1], [/(album|Album|ALBUM|LP|EP)\s?[\:\|\-]*\s"?([\w\s]+)/, 2], [/"([\w\s]+\s(EP|LP))"/, 1]]

    album_patterns.each do |pattern_set|
      unless @autodata[:album]
        parse_album(*pattern_set)
      end
    end
  end

  def parse_album(pattern, i)
    if @description.match(pattern)
      @autodata[:album] = @description.match(pattern)[i].strip
    end
  end

  def self.is_track?(title, duration)
    return false if title.match(/[\[\(]full album[\]\)]/)
    duration <= 1200
  end

private

  def extraneous_info
    extraneous_phrases = [ '1080p', '720p', 'audio', 'audio only', 'full song', 'hd video', 'lyric video', 'lyrics', 'lyrics on screen', 'new song', 'new video', 'official', 'official audio', 'official hd video', 'official music video', 'official song', 'official video', 'with lyrics', 'w/ lyrics']

    arr = Array.new
    extraneous_phrases.each do |phrase|
      arr << Regexp.new(Regexp.quote("[#{phrase}]"), Regexp::IGNORECASE)
      arr << Regexp.new(Regexp.quote("(#{phrase})"), Regexp::IGNORECASE)
    end
    return arr
  end

end
