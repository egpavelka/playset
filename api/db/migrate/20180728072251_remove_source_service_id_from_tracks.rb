class RemoveSourceServiceIdFromTracks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tracks, :source_service_id, :string
    rename_column :tracks, :submitted_url, :url
  end
end
