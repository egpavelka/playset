class CreateEmbeddeds < ActiveRecord::Migration[5.0]
  def change
    create_table :embeddeds do |t|
      t.string :type

      t.timestamps
    end
  end
end
