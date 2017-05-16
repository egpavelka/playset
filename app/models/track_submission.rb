class TrackSubmission < ApplicationRecord

  STEPS = %w(add_source add_media add_metadata).freeze

  KINDS = [['Embedded'], ['Video'], ['Upload']].freeze

  class AddSource
    include ActiveModel::Model
    # include ActiveModel::Validations
    include ActiveModel::Validations::Callbacks

    attr_accessor :track

    delegate :id, :status, :kind, :submission_source, :title, :artist, :album, :year, :album_art, to: :track

    def initialize(track_attributes)
      @track = Track.new(track_attributes)
      @track.media_sources
    end

    before_validation :set_media_source

    def set_media_source
      media_kind = @track.kind.safe_constantize.new
      @media = @track.media_sources.build(media: media_kind, source_path: submission_source)
      puts @media.attributes
      puts @track.attributes
    end

    validates :kind, inclusion: { in: %w(Embedded Upload Video) }
    validate :media_source_has_source_path

    def media_source_has_source_path
      if @media.source_path.nil?
        errors.add(:media_sources, "Link to media is required.")
      end
    end

  end

  class AddMedia < AddSource
    validates :status, inclusion: { in: %w(new pending active flagged broken) }
  end

  class AddMetadata < AddMedia
    validates :title, presence: true
    validates :album, presence: true
    validates :artist, presence: true
    validates :year, length: { is: 4 }
    validates :album_art, presence: true
  end

end
