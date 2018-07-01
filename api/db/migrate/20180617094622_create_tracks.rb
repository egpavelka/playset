class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.string :source_path
      t.string :title
      t.string :artist
      t.string :album
      t.string :source_service
      t.string :source_service_id
      t.string :media_type
      t.references :submission, polymorphic: true
      t.references :user, foreign_key: true 

      t.timestamps
    end
  end
end
