class TrackSubmission < ApplicationRecord

  STEPS = %w(set_up add_source add_media add_metadata).freeze

  class SetUp
    include ActiveModel::Model

    attr_accessor :track
    delegate :kind, :status, :title, :artist, :album, :year, to: :track

    def initialize(track_attributes)
      @track = Track.new(track_attributes)
    end
  end


  class AddSource < SetUp
    validates :kind, inclusion: { in: %w(Embedded Upload Video) }
    validates :source_path, presence: true
  end

  class AddMedia < AddSource
    validates :media_source, presence: true
  end

  class AddMetadata < AddMedia
    validates :title, presence: true
    validates :album, presence: true
    validates :artist, presence: true
    validates :year, length: { is: 4 }
  end

end
