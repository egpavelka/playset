class RemoveUrlSourceFromTracks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tracks, :url_src, :string
  end
end
