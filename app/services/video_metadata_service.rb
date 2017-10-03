class VideoMetadataService
  # Methods available to multiple classes for handling data
  # from external sources.
  include LastFmLookupService
  attr_accessor :video, :title, :parsing, :autodata

  def initialize(params)
    @title = params[:title]
    @description = params[:description]
    @autodata = Hash[]
  end

  def perform
    clean_title
    find_year
    find_title_and_artist
    find_album
    data_hash
  end

  def data_hash
    Hash[
      hint: { title_hint: @title, description_hint: @description },
      metadata: {
        title: @autodata[:title],
        artist: @autodata[:artist],
        album: @autodata[:album]
      },
      year_params: [@autodata[:year], '%Y']
    ]
  end

  # The easiest thing to find and remove from the title is the year
  # (if present), since the format is almost always [YYYY] or (YYYY).
  # (Also check the description for a year.)

  year_patterns = [/[\[\(]([\d]{4})[\]\)]/, /\(c\)\s?([\d]{4})/i, /year\:\s([\d]{4})/i]
  # [YYYY], (YYYY) # (C) YYYY # Year: YYYY

  def find_year
    year_patterns.each do |pattern|
      parse_year(pattern) unless @autodata[:year]
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

  # These are reliably classified as clutter, so they'll be removed
  # whether they appear inside parentheses or not.
  extraneous_words = %w[audio explicit hd lyrics official video]

  extraneous_phrases = ['1080p', '720p', 'audio only', 'clean version', 'full song', 'hd video', 'long version', 'lyric video', 'lyrics on screen', 'new song', 'new video', 'official audio', 'official hd video', 'official music video', 'official song', 'official video', 'stereo version', 'videoclip', 'video clip', 'visualization', 'vizualizer', 'with lyrics', 'w/ lyrics', '+ lyric']

  # Then check for the common phrases and patterns above.
  def clean_title
    extraneous_phrases.each do |blah|
      @title.gsub!(blah, '')
    end
    @title.strip!
  end

  # Dump empty matches
  def clean_results(arr)
    arr.reject{|obj| obj.nil?}
  end

  # Get rid of parentheses with junk if they're at the beginning or end of the title;
  def parse_parentheses(str)
    check_parentheses(str).each do |match|
      if extraneous_phrases.any? { |phrase| str.include?(phrase)} || extraneous_words.any? {|word| str == word }
      end
    end
  end

def check_parentheses(str)
  parentheses = /[\[|\(][^\(\[\]\)]*[\]|\)]/
  str.scan(parentheses)
end

def check_quotes(str)
  quotes = /"[^"]*"/
  str.scan(quotes)
end

def check_splitters(str)
  splitters = /\s[[\-\|]|\/\/|\/]\s/
  str.scan(splitters)
end
# Titles are often split by ' - ', ' | ', and ' / ' or ' // ';
# Assuming the first part is the artist name and the second is the title should catch most cases.
# Any time quotation marks are in the title
def split_title
  #
  quote = check_quotes(@title)[0]
  splits = check_splitters(@title)
  # Split on the first 'split' character--as long as it's outside quotation marks
  if splits
    if check_splitters(quote) && @title.index(/"/) < @title.index(splits[1])
      splits.find {|split| @title.index(split, @title.rindex(/"/) + 1)}
    else
      # Treat as normal - splitter
    end
    str.split(splitters, 2)
  elsif quotes
    # Treat as normal - quotes
    # split at quotes might result in three strings so deal with that here
    # (maybe: if quote occurs at beginning of string, look for splitter or the word 'by' and grab artist there)
  else
    # GIVE UP, MANUAL ENTRY
  end
end

def parse_lookup_params(arr)
# Basically check for parentheses and second splitters in the strings created by split_title and, if they exist, try looking up the song first with everything up to the parentheses/split mark, and if that doesn't return anything, try again with the next segment included
  arr.each do |str|
    # Dump bullshit from end of each string
    parse_parentheses(str)

    if check_splitters(str) || check_parentheses(str)
      # lookup with info up to first parenthesis or splitter
      # otherwise try with full string
    else
      # lookup normally
    end
  end
end
#
# @parsing = @title.split(splitters).reject{|str| str.empty?}
# if @parsing.length

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

  def find_title_and_artist_in_description
    title_patterns =[/(track|song|single)\s"([\w\s]+)"/i, /([\w\s]*)[\-\:\|]?"([\w\s]+)"/i]
  end

  def find_album
    album_patterns = [[/"([\w\s]+)"\s(album|Album|ALBUM|LP|EP)/, 1], [/(album|Album|ALBUM|LP|EP)\s?[\:\|\-]*\s"?([\w\s]+)/, 2], [/"([\w\s]+\s(EP|LP))"/, 1]]

    album_patterns.each do |pattern_set|
      parse_album(*pattern_set) unless @autodata[:album]
    end
  end

  def parse_album(pattern, i)
    return nil unless @description.scan(pattern)
    @autodata[:album] = @description.match(pattern)[i].strip
  end

  def self.is_track?(title, duration)
    return false if title.scan(/[\[\(]full album[\]\)]/)
    duration <= 1200
  end

  private

  def extraneous_info
    arr = Array[]
    extraneous_phrases.each do |phrase|
      arr << Regexp.new(Regexp.quote("[#{phrase}]"), Regexp::IGNORECASE)
      arr << Regexp.new(Regexp.quote("(#{phrase})"), Regexp::IGNORECASE)
    end
    arr
  end
end
