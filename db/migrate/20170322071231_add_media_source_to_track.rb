class AddMediaSourceToTrack < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :media_source, :text
    remove_column :embeddeds, :api_source, :integer
  end
end
