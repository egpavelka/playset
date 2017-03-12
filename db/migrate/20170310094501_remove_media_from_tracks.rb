class RemoveMediaFromTracks < ActiveRecord::Migration[5.0]
  def change
    remove_reference :tracks, :media, polymorphic: true
  end
end
