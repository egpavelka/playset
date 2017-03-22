class MediaSource < ApplicationRecord
  belongs_to :track, foreign_key: 'track_id'
  belongs_to :media, polymorphic: true, dependent: :destroy
  validates :source_path, presence: true
  attr_reader :kind
  attr_accessor :title, :artist, :album, :year
end
