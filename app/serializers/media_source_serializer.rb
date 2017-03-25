class MediaSourceSerializer < ActiveModel::Serializer
  attributes :media_id, :media_type, :source_path
  belongs_to :track, serializer: TrackSerializer
  has_one :media, polymorphic: true
end
