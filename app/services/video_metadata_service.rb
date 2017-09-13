# Methods available to multiple classes for handling data from external sources.

class VideoMetadataService
  attr_accessor :video, :title, :parsing, :autodata

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

# These are reliably classified as clutter, so they'll be removed whether they appear inside parentheses or not.
extraneous_phrases = [ '1080p', '720p', 'audio only', 'clean version',  'full song', 'hd video', 'long version', 'lyric video', 'lyrics on screen', 'new song', 'new video', 'official audio', 'official hd video', 'official music video', 'official song', 'official video', 'stereo version', 'videoclip', 'video clip', 'visualization', 'vizualizer', 'with lyrics', 'w/ lyrics', '+ lyric' ]
# These can be legit, so they'll only be removed if they're inside parentheses.
extraneous_words = ['audio', 'explicit', 'hd', 'lyrics', 'official', 'video']

# Then check for the common phrases and patterns above.
def clean_title
  extraneous_phrases.each do |blah|
    @title.gsub!(blah, '')
  end
  @title.strip!
end

def has_extraneous_info?(str)
  extraneous_phrases.any? {|phrase| str.include?(phrase)} ||
  extraneous_words.any? {(|word| str == word)}
end

def check_parentheses(str)
  str.match(/[\[|\(][^\(\[\]\)]*[\]|\)]/).to_a.each do |match|
    if has_extraneous_info?(match)
      if str.start_with?(match) || str.end_with?(match)
       str.gsub!(match, '').strip!
      end
    end
  end
end

# Titles are often split by ' - ', ' | ', and ' / ' or ' // ';
# Assuming the first part is the artist name and the second is the title should catch most cases.
# Any time quotation marks are in the title
def split_title
  splitters = /\s[[\-\|]|\/\/|\/]\s/
  @parsing = @title.split(splitters).reject{|str| str.empty?}
  if @parsing.length
end

def sort_title_format
  if @title.match(/"[^"]*"/)

  elsif @title.match()
  elsif @title.match()
  else
  end
end

##### DASHES AND OTHER STANDARD SEPARATORS #####
# If the array returned by title split has two items,
# Calle 13 - Se Vale To-To
# Ss-Say - care (1985)
# AYAX Y PROK - REPROCHES (PROD BLASFEM) | VIDEOCLIP
# Freddie Gibbs & Madlib - Deeper (Official) - Piñata
# Vibravoid - The Politics Of Ecstasy - HQ Stereo Version
# Nmesh - A Face Without Eyes / Byte By Byte (Official)

##### QUOTATION MARKS #####
# If quotation marks are used, it's pretty much always to signify the title.
# Usually, that looks like: Earl Sweatshirt "Chum"
# But other cases:
# Earl Sweatshirt “Hive” ft. Casey Veggies & Vince Staples
# Anita Tijoux "A Veces" (con Hordatoj) -Oficial-
# Kurt Vile - "Pretty Pimpin" Official Video

#### BUT WAIT!
# Blues Control "Opium Den / Fade to Blue"
  # Don't split on standard splitting characters if they occur within quotation marks.
# A Band Called "O" - Coasting
# The Black Angels - "Bad Vibrations" Billboard Tastemakers Session

### SHOUTOUT TO: THE WORD 'BY'
# Harlem Nocturne by Sam "The Man" Taylor
# 'I FINK U FREEKY' by DIE ANTWOORD (Official)


  # album "b'lieve i'm goin down"
  # #SELFIE (Official Music Video) - The Chainsmokers
  # Ylvis - The Fox (What Does The Fox Say?) [Official music video HD]
  # Carlo Savina - Beat Ruggente [Italy, Psych-Beat] (1966)
  # HYUNA - 'Bubble Pop!' (Official Music Video)


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
