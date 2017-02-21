class CreateYoutubeApis < ActiveRecord::Migration[5.0]
  def change
    create_table :youtube_apis do |t|

      t.timestamps
    end
  end
end
