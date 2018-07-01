class Types::TrackType < Types::BaseObject
  field :id, ID, null: false
  field :source_path, String, null: false
  field :title, String, null: false
  field :artist, String, null: false
  field :album, String, null: true
  field :source_service, String, null: false
  field :source_service_id, String, null: false
  field :media_type, String, null: false
end
