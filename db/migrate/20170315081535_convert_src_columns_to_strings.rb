class ConvertSrcColumnsToStrings < ActiveRecord::Migration[5.0]
  def change
    remove_column :embeddeds, :url_src, :text
    remove_column :uploads, :file_src, :text
    add_column :embeddeds, :url_src, :string
    add_column :uploads, :file_src, :string
    add_column :media_sources, :track_id, :integer
  end
end
