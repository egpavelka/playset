class AddAlbumArtToTrackSubmission < ActiveRecord::Migration[5.0]
  def self.up
    change_table :track_submissions do |t|
      t.attachment :album_art
    end
  end

  def self.down
    remove_attachment :track_submissions, :album_art
  end
end
