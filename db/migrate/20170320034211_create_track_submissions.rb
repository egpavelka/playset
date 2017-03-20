class CreateTrackSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :track_submissions do |t|

      t.timestamps
    end
    add_column :tracks, :status, :string
  end
end
