class AddProfileBioToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :profile_bio, :text
  end
end
