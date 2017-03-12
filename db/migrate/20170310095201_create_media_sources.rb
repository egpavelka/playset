class CreateMediaSources < ActiveRecord::Migration[5.0]
  def change
    create_table :media_sources do |t|
      t.references :media, polymorphic: true

      t.timestamps
    end
  end
end
