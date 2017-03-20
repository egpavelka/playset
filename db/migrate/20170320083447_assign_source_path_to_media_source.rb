class AssignSourcePathToMediaSource < ActiveRecord::Migration[5.0]
  def change
    add_column :media_sources, :source_path, :string
    remove_column :embeddeds, :url_source
    remove_column :uploads, :file_source
    remove_column :videos, :video_source
  end
end
