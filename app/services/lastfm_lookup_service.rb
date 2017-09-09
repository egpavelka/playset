class SoundcloudService
  include DataGrabUtil
  attr_accessor :t, :a, :data

  def initialize(params)
    @t = params[:title]
    @a = params[:artist]
    @
  end

  def perform
    unless @data['title'] && @data['artist'] && @data['album'] && @data['year']
    end

  def query(endpoint, query_string)
    DataGrabUtil::read_json("http://ws.audioscrobbler.com/2.0/?method=#{ endpoint }&api_key=#{ Rails.application.secrets.lastfm_api_key }&#{query_string}&format=json")
  end

  def verify_track
    response = query('track.Search', "title=#{ @t }")
    response.each do

    end
  end

  def correct_track
    begin
      response = query('track.getcorrection', "artist=#{ @a }&title=#{ t }")
      corrected = response['corrections']['correction'].first[1]
      @data = { :title => corrected['name'], :artist => corrected['artist']['name'] }
    rescue

    end
  end

  def find_album
    response = query('track.getInfo', "artist=#{ @data[:artist] }&track=#{ @data[:title] }")
    @data[:album] = response['track']['album']['title']
  end

  def album_getinfo
    response = query('album.getInfo', "artist=#{ @a }&track=#{ @data[:album] }")
    response['album']['tags']['tag'].each|  }
  end

  def verify(response)
    response.each do |track|
      track.select!{|k,v| k == 'name' || k == 'artist'}
      t, a = track.keys

      unless @data[:title] && @data[:artist]
        (double_check(t, @t) && double_check(a, @a))
        || (double_check(t, @a) && double_check(a, @t))
        ? @data = { :title => t, :artist => a }
        end
      end
    end


    def check_bidirectional_inclusion(j,k)
      j.downcase.include?(k.downcase) || k.downcase.include?(j.downcase)
    end

  end

end
