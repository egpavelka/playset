class AddKindToTracks < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :kind, :string
  end
end
