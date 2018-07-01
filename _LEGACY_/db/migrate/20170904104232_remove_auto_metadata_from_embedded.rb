class RemoveAutoMetadataFromEmbedded < ActiveRecord::Migration[5.1]
  def change
    add_reference :embeddeds, :user, foreign_key: true
    add_reference :uploads, foreign_key: true
    remove_column :embeddeds, :auto_metadata
  end
end
