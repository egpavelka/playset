class Types::Track < Types::BaseObject
  name 'Track'

  field :id, ID, "Track ID", null: false
  field :title, String, "Track title", null: false
  field :artist, String, "Track artist", null: false
  field :album, String, "Album track appears on"
  field :year, String, "Year album or single was released"
end
