class RenameSourceServiceToService < ActiveRecord::Migration[5.2]
  def change
    rename_column :tracks, :source_service, :service
  end
end
