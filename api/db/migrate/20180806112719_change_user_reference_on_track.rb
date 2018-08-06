class ChangeUserReferenceOnTrack < ActiveRecord::Migration[5.2]
  def change
    remove_column :tracks, :user_id, :bigint
    change_table :tracks do |t|
      t.references :user, foreign_key: true
    end
  end
end
