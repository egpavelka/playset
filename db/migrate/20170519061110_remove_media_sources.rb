class RemoveMediaSources < ActiveRecord::Migration[5.0]
  def change
    remove_column :tracks, :kind, :string
    remove_column :tracks, :state, :string
    remove_column :tracks, :submission_source, :string
    drop_table :media_sources do |t|
    end
  end
end
