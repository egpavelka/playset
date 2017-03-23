class TrackSubmission < ApplicationRecord

  STEPS = %w(add_source add_media add_metadata).freeze

  KINDS = [['Embedded'], ['Video'], ['Upload']].freeze

  class AddSource
    include ActiveModel::Model
    include ActiveModel::Validations
    include ActiveModel::Validations::Callbacks

    attr_accessor :track
    delegate :kind, :status, :title, :artist, :album, :year, :media_id, :media_type, :source_path, to: :track

    def initialize(track_attributes)
      puts track_attributes
      @track = Track.new(track_attributes)
    end

    before_validation :set_media_source

    def set_media_source
      @media = @track.create_media_source(media: kind.safe_constantize.new, source_path: source_path)
      # @media.source_path = media_source.source_path
      puts @media.attributes
    end

    validates :kind, inclusion: { in: %w(Embedded Upload Video) }
    validate :media_source_has_source_path

    def media_source_has_source_path
      if @media.source_path.nil?
        errors.add(:media_source, "Link to media is required.")
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
  end

end
