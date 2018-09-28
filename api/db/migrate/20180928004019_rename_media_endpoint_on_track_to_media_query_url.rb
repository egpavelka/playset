class RenameMediaEndpointOnTrackToMediaQueryUrl < ActiveRecord::Migration[5.2]
  def change
    rename_column :tracks, :media_endpoint, :media_query_url
  end
end
