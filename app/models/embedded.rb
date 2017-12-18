class Embedded < ApplicationRecord
  include EmbeddingUtil
  has_one :track, as: :media, dependent: :destroy

  ####################
  # SETUP: SOURCES,
  # LINK CHECK
  ####################

  validates :source_path, presence: true
  after_validation :set_source
  before_save :source_service, presence: true

  ####################
  # BASE METHODS FOR
  # SOURCE SUBCLASSES
  ####################

  def set_source
    url_source = EmbeddingUtil.supported_sources.keys.detect { |valid_format| source_path.match(valid_format) }
    if url_source
      self.source_service = EmbeddingUtil.supported_sources.fetch(url_source)
    else
      errors.add(:base, "The URL could not be matched to a track from a supported source.")
    end
  end
end
