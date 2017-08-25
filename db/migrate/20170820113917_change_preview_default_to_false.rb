class ChangePreviewDefaultToFalse < ActiveRecord::Migration[5.1]
  def change
    change_column :tracks, :preview, :boolean, default: true
  end
end
