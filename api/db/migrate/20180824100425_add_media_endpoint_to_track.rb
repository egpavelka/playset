class AddMediaEndpointToTrack < ActiveRecord::Migration[5.2]
  def change
    add_column :tracks, :media_endpoint, :string
  end
end
