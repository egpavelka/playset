class AddFileSrcToTracks < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :file_src, :string
  end
end
