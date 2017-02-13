class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.string :url_src
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :tracks, [:user_id, :created_at]
  end
end
