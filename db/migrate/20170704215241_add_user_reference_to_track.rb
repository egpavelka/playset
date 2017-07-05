class AddUserReferenceToTrack < ActiveRecord::Migration[5.1]
  def change
    add_reference :tracks, :user, foreign_key: true
  end
end
