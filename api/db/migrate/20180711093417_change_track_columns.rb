class ChangeTrackColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :tracks, :source_path, :submitted_url
    remove_column :tracks, :submission_type
    remove_column :tracks, :submission_id
    add_column :tracks, :media_url, :string
  end
end
