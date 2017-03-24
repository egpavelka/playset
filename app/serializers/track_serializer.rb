class TrackSerializer < ActiveModel::Serializer
  attributes :status, :kind, :title, :artist, :album, :year
  has_one :media
end
