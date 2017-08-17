class AddPreviewToTracks < ActiveRecord::Migration[5.1]
  def change
    add_column :tracks, :preview, :boolean
  end
end
