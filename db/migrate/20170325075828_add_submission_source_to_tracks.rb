class AddSubmissionSourceToTracks < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :submission_source, :string
  end
end
