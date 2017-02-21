class CreateSoundcloudApis < ActiveRecord::Migration[5.0]
  def change
    create_table :soundcloud_apis do |t|

      t.timestamps
    end
  end
end
