class CleanUp < ActiveRecord::Migration[5.0]
  def change
    remove_reference :tracks, :playable, polymorphic: true, index: true
    add_reference :tracks, :media, polymorphic: true, index: true
    add_column :embeddeds, :source_path, :string
    remove_column :tracks, :kind, :string
    remove_column :tracks, :state, :string
    remove_column :tracks, :submission_source, :string
  end
end
