class AddArtworkUrlToTrack < ActiveRecord::Migration[5.2]
  def change
    add_column :tracks, :artwork_url, :string
  end
end
