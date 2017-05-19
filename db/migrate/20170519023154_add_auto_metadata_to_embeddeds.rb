class AddAutoMetadataToEmbeddeds < ActiveRecord::Migration[5.0]
  def change
    add_column :embeddeds, :auto_metadata, :string
  end
end
