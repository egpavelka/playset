class MediaSource < ApplicationRecord
  belongs_to :track, foreign_key: 'track_id'
  belongs_to :media, polymorphic: true, dependent: :destroy
  attr_accessor :kind, :title, :artist, :album, :year
end
