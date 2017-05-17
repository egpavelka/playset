class TrackSubmission < ApplicationRecord

  STEPS = %w(add_source add_media add_metadata).freeze

  KINDS = [['Embedded'], ['Video'], ['Upload']].freeze

  class AddSource
    include ActiveModel::Model
    include ActiveModel::Validations::Callbacks

    attr_accessor :track

    delegate :id, :status, :kind, :submission_source, :title, :artist, :album, :year, :album_art, :album_art_file_name, :album_art_content_type, :album_art_size, to: :track

    def initialize(track_attributes)
      @track = Track.new(track_attributes)
      @track.media_sources
    end

    before_validation :set_media_source

    def set_media_source
      media_kind = @track.kind.safe_constantize.new
      @media = @track.media_sources.build(media: media_kind, source_path: submission_source)
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
  end


  #ALBUM ART
  do_not_validate_attachment_file_type :album_art
    # has_attached_file :album_art,
    # styles: { medium: {geometry: '400x400>', convert_options: '-colorspace Gray'},
    # large: {geometry: '800x800>', convert_options: '-colorspace Gray'} },
    # url: '/public/assets/images/album_art/:id/:style/:basename.:extension',
    # path: ':rails_root/public/assets/images/album_art/:id/:style/:basename.:extension',
    # default_url: 'assets/album_art/aa_test.jpg',
    # content_type: { content_type: /\Aimage\/.*\z/ },
    # size: { in: 0..100.kilobytes }

  def art_from_url(url)
    self.album_art = URI.parse(url)
  end

end
