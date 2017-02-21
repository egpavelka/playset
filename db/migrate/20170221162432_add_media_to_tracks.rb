class AddMediaToTracks < ActiveRecord::Migration[5.0]
  def change
    add_reference :tracks, :media, polymorphic: true
  end
end
