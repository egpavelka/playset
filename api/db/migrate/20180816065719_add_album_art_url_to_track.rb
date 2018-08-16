class AddAlbumArtUrlToTrack < ActiveRecord::Migration[5.2]
  def change
    rename_column :tracks, :artwork_url, :album_art_origin
    add_column :tracks, :album_art_url, :string
  end
end
