class ChangeAutoMetadataToText < ActiveRecord::Migration[5.0]
  def change
    remove_column :embeddeds, :auto_metadata, :string
    add_column :embeddeds, :auto_metadata, :text
    add_column :embeddeds, :source_service, :string
  end
end
