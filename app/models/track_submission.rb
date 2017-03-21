class TrackSubmission < ApplicationRecord

  class SetUp
    include ActiveModel::Model

    attr_accessor :track
    delegate :kind, :status, :title, :artist, :album, :year, to: :track

    def initialize
      @track = Track.new(track_attributes)
    end
  end

  class Source < SetUp
    validates :kind, inclusion: { in: %w(Embedded Upload Video) }
    validates :source_path, presence: true
  end

  class Media < Source
    validates :media_source, presence: true
  end

  class Metadata < Media
    validates :title, presence: true
    validates :album, presence: true
    validates :artist, presence: true
    validates :year, length: { is: 4 }
  end

end
