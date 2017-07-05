class CreateUploads < ActiveRecord::Migration[5.1]
  def change
    create_table :uploads do |t|
      t.attachment :audio

      t.timestamps
    end
  end
end
