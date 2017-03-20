class TrackSubmission < ApplicationRecord
  include ActiveModel::Model

  delegate :kind, :status, :title, :artist, :album, :year, to: :track
  attr_accessor :track, :media_source, :embedded, :upload, :video

  def initialize
    self.track = Track.new(status: 'new')
  end

  # check validity of both model and form object
  def save
    track_valid = track.valid?
    if valid? && track_valid
      track.save
    else
      track.errors.each do |field, error|
        errors.add(field, error)
      end
      false
    end
  end


  validates :kind, inclusion: { in: %w(Embedded Upload Video) }, on: :set_source

  def set_source
    track.kind = params[:commit]
    # make sure kind corresponds with file/link source field
    # check that it's a valid member of that class
    # if track_loaded? show metadata fields
    # else
  end

  def save_source
    self.save if self.valid?(:set_source)
  end

  def save_media
    self.save if self.valid?([:set_source, :set_media])
  end

  def save_metadata
    self.save if self.valid?([:set_source, :set_media, :set_metadata])
  end



  def track_loaded?
    # upload_successful? or embed_successful? (got api response?)
  end

  def has_metadata?
    # retrieve metadata from embedded sources
    # check mp3 for metadata
    # populate metadata form with retrieved values, disable populated fields
  end

  # Track metadata
  def track_metadata
    validates :title, presence: true
    validates :album, presence: true
    validates :artist, presence: true
    validates :year, length: { is: 4 }
  end

end
