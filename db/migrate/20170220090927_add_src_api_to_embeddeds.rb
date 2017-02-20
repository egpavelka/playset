class AddSrcApiToEmbeddeds < ActiveRecord::Migration[5.0]
  def change
    add_column :embeddeds, :src_api, :string
  end
end
