class MediaSourceSerializer < ActiveModel::Serializer
  attributes :media_id, :media_type, :source_path
  has_one :media, polymorphic: true
end
