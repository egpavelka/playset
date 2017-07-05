class CreateEmbeddeds < ActiveRecord::Migration[5.1]
  def change
    create_table :embeddeds do |t|
      t.string :source_path
      t.string :source_service
      t.text :auto_metadata

      t.timestamps
    end
  end
end
