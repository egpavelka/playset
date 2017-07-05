class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :artist
      t.string :album
      t.string :year
      t.attachment :album_art
      t.references :media, polymorphic: true
      t.string :playback
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
