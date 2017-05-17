class DropVideosAndAddPlaybackToTracks < ActiveRecord::Migration[5.0]
  def change
    drop_table :videos
    add_column :tracks, :playback, :string
  end
end
