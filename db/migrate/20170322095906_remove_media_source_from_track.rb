class RemoveMediaSourceFromTrack < ActiveRecord::Migration[5.0]
  def change
    remove_column :tracks, :media_source, :string
  end
end
