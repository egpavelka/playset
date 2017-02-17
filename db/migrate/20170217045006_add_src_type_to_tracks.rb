class AddSrcTypeToTracks < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :src_type, :string
  end
end
