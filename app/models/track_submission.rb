class TrackSubmission < ApplicationRecord

  STEPS = %w(add_source add_media add_metadata).freeze

  KINDS = [['Embedded'], ['Video'], ['Upload']].freeze

  class AddSource
    include ActiveModel::Model
    include ActiveModel::Validations
    include ActiveModel::Validations::Callbacks

    attr_accessor :track
    delegate :kind, :status, :media_source, :title, :artist, :album, :year, to: :track

    def initialize(track_attributes)
      @track = Track.new(track_attributes)
    end

    before_validation :set_media_source

    def set_media_source
      media_kind = kind.safe_constantize.new
      media_source.build(media: media_kind)
    end

    validates :kind, inclusion: { in: %w(Embedded Upload Video) }
    validate :media_source_has_source_path

    def media_source_has_source_path
      if media_source.source_path.nil?
        errors.add(:media_source, "Link to media is required.")
      end
    end

    def media
      media_source&.media
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
