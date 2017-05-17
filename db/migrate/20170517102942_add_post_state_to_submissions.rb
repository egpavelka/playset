class AddPostStateToSubmissions < ActiveRecord::Migration[5.0]
  def change
  remove_column :tracks, :status, :string
  add_column :tracks, :state, :string, default: 'draft'
  end
end
