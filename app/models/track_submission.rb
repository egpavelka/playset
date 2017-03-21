class TrackSubmission < ApplicationRecord

  STEPS = %w(add_source add_media add_metadata).freeze

  KINDS = [['Embedded', 'embedded'], ['Video', 'video'], ['Upload', 'upload']].freeze

  class AddSource
    include ActiveModel::Model

    attr_accessor :track
    delegate :kind, :status, :media_source, :title, :artist, :album, :year, to: :track

    def initialize(track_attributes)
      @track = Track.new(track_attributes)
    end

    validates :kind, inclusion: { in: %w(Embedded Upload Video) }
    validates :media_source, presence: true
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
