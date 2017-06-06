class AddPublishedToTracks < ActiveRecord::Migration[5.1]
  def change
    add_column :tracks, :published, :boolean, default: false
  end
end
