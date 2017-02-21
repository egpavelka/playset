class RemoveSrcApiFromEmbedded < ActiveRecord::Migration[5.0]
  def change
    remove_column :embeddeds, :src_api, :string
  end
end
