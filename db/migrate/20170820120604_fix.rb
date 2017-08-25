class Fix < ActiveRecord::Migration[5.1]
  def change
    change_column :tracks, :preview, :boolean, default: false
  end
end
