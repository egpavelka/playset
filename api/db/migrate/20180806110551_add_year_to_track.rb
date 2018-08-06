class AddYearToTrack < ActiveRecord::Migration[5.2]
  def change
    add_column :tracks, :year, :integer
  end
end
