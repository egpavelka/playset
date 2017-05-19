class MediaSource < ApplicationRecord
  belongs_to :track
  belongs_to :media, polymorphic: true
  validates :source_path, presence: true
  # validates_presence_of :media_type
  # validates_presence_of :media_id
  attr_reader :kind
  attr_accessor :title, :artist, :album, :year

end
