class AddSrcToEmbedded < ActiveRecord::Migration[5.0]
  def change
    add_column :embeddeds, :url_src, :string
  end
end
