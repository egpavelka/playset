class RemoveSrcTypeFromTracks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tracks, :src_type, :string
  end
end
