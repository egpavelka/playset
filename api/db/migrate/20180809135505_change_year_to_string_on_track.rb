class ChangeYearToStringOnTrack < ActiveRecord::Migration[5.2]
  def change
    remove_column :tracks, :year, :integer
    add_column :tracks, :year, :string
  end
end
