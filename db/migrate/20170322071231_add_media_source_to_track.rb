class AddMediaSourceToTrack < ActiveRecord::Migration[5.0]
  def change
    remove_column :embeddeds, :api_source, :integer
  end
end
