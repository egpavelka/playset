class DropTrackSubmissions < ActiveRecord::Migration[5.0]
  def change
    drop_table :track_submissions
  end
end
