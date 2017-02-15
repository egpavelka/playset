class AddMetadataToTracks < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :title, :string
    add_column :tracks, :artist, :string
    add_column :tracks, :album, :string
    add_column :tracks, :year, :string
  end
end
