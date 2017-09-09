# Methods available to multiple classes for handling data from external sources.

class VideoMetadataService
  attr_accessor :video, :title, :response, :autodata

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

# These are reliably classified as clutter, so they'll be removed whether they appear inside parentheses or not.
extraneous_phrases = [ '1080p', '720p', 'audio only', 'clean version',  'full song', 'hd video', 'long version', 'lyric video', 'lyrics on screen', 'new song', 'new video', 'official audio', 'official hd video', 'official music video', 'official song', 'official video', 'videoclip', 'video clip', 'visualization', 'vizualizer', 'with lyrics', 'w/ lyrics', '+ lyric' ]
# These can be legit, so they'll only be removed if they're inside parentheses.
extraneous_words = ['audio', 'explicit', 'hd', 'lyrics', 'official', 'video']

# The easiest thing to find and remove from the title is the year (if present), since the format is almost always [YYYY] or (YYYY).  (Also check the description for a year.)

def find_year
  year_patterns = [ /[\[\(]([\d]{4})[\]\)]/, /\(c\)\s?([\d]{4})/i, /year\:\s([\d]{4})/i ] # [YYYY], (YYYY) # (C) YYYY # Year: YYYY
  year_patterns.each do |pattern|
    unless @autodata[:year]
      parse_year(pattern)
    end
  end
end

def parse_year(pattern)
  if @title.match(pattern)
    @autodata[:year] = title.match(pattern)[1]
    # @title.gsub!(title.match(year_pattern)[0], '').strip!
  elsif @description.match(pattern)
    @autodata[:year] = @description.match(pattern)[1]
  end
end

# Then check for the common phrases and patterns above.
def clean_title
  garbage = extraneous_info
  extraneous_info.each do |blah|
    @title.gsub!(blah, '')
  end
  @title.strip!
end

def has_extraneous_info?(str)
  extraneous_phrases.any? { |phrase| str.include?(phrase) } ||
  extraneous_words.any? ( |word| str == word)
end

def check_parenthetical
  para_match = @title.scan(/[\[|\(]([^\(\[\]\)]*)[\]|\)]/).reverse
  para_match.each do |match|
  if has_extraneous_info?(match)
    if @title.start_with?(match) || @title.end_with
     @title.gsub!(match, '')
    else
      str = @title.split(match)[-1]

    end
  elsif @title.match(para_pattern)
  end
end

# Titles are often split by ' - ', ' | ', and ' / ' or ' // ';
# Assuming the first part is the artist name and the second is the title should catch most cases.
def split_title
  splitters = /[\-\|]|\/\/|\//
  title_arr = @title.split(splitters).each {|str| str.strip!}

end

# If quotation marks are used, it's pretty much always to signify the title.

  # Split on - / |
  # check for weird stuff and year; if it occurs at beginning or end, just remove it
  # if quotation marks, title is inside
  # if (official...) or (year) is in the left split side, title is probably to the left of it, and anything

  # Kurt Vile - "Pretty Pimpin" Official Video
  # album "b'lieve i'm goin down"
  /['|"]([^'"]*)['|"]\sby\s([^'"]*)/i # 'I FINK U FREEKY' by DIE ANTWOORD (Official)
  # #SELFIE (Official Music Video) - The Chainsmokers
  # Ylvis - The Fox (What Does The Fox Say?) [Official music video HD]
  # HYUNA - 'Bubble Pop!' (Official Music Video)
  # Calle 13 - Se Vale To-To
  # The Black Angels - "Bad Vibrations" Billboard Tastemakers Session
  # AYAX Y PROK - REPROCHES (PROD BLASFEM) | VIDEOCLIP

  def parse_title(pattern)
    arr = @title.split(pattern, 2)
    @autodata[:artist] = arr[0]
    @autodata[:title] = arr[1]
  end

  def find_title_and_artist_hard_mode
    title_patterns = [
      /([^"]*)\s"([^"]*)"/i # St. Vincent[1] "Hello"[2]
    ]
  end

  def find_title_and_artist_in_description
    title_patterns =[
      /(track|song|single)\s"([\w\s]+)"/i,
      /([\w\s]*)[\-\:\|]?"([\w\s]+)"/i,
    ]
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

  def check_description_for_link
    bandcamp_pattern = /[^#\&\?\/\s]*\.bandcamp\.com\/?[^#\&\?\/\s]*/i
    soundcloud_pattern = /(soundcloud\.com\/?[^#\&\?\/\s\\]*)/i
    if @description.match(bandcamp_pattern)
      return BandcampService.new(url: @description.match(bandcamp_pattern)[1])
    elsif @description.match(soundcloud_pattern)
      return SoundcloudService.new(url: @description.match(soundcloud_pattern)[1])
  end

  def self.is_track?(title, duration)
    return false if title.match(/[\[\(]full album[\]\)]/)
    duration <= 1200
  end

private

  def extraneous_info
    arr = Array.new
    extraneous_phrases.each do |phrase|
      arr << Regexp.new(Regexp.quote("[#{phrase}]"), Regexp::IGNORECASE)
      arr << Regexp.new(Regexp.quote("(#{phrase})"), Regexp::IGNORECASE)
    end
    return arr
  end

end
