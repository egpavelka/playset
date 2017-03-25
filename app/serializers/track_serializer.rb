class TrackSerializer < ActiveModel::Serializer
  attributes :status, :kind, :title, :artist, :album, :year
  has_many :media_sources
end
