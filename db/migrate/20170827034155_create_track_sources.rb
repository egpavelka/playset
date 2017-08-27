class CreateTrackSources < ActiveRecord::Migration[5.1]
  def change
    create_table :track_sources do |t|
      t.references :media, polymorphic: true

      t.timestamps
    end
  end
end
