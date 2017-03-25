class FixTrackReferenceInMediaSource < ActiveRecord::Migration[5.0]
  def change
    remove_column :media_sources, :track_id, :integer
    add_reference :media_sources, :track, foreign_key: true
  end
end
