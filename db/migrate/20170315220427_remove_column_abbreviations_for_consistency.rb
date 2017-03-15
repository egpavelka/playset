class RemoveColumnAbbreviationsForConsistency < ActiveRecord::Migration[5.0]
  def change
    rename_column :uploads, :file_src, :file_source
    rename_column :embeddeds, :url_src, :url_source
  end
end
