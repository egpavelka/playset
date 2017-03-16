class AddTrackRefToMediaSources < ActiveRecord::Migration[5.0]
  def change
    change_column :media_sources, :track_id, :integer, index: true
    add_foreign_key :media_sources, :tracks
  end
end
