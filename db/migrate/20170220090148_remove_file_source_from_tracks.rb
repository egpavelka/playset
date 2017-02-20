class RemoveFileSourceFromTracks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tracks, :file_src, :string
  end
end
