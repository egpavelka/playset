class AddMediaPathToTracks < ActiveRecord::Migration[5.1]
  def change
    add_column :tracks, :media_path, :string
  end
end
