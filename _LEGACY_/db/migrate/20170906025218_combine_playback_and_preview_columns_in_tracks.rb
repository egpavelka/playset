class CombinePlaybackAndPreviewColumnsInTracks < ActiveRecord::Migration[5.1]
  def change
    remove_column :tracks, :preview, :boolean
  end
end
