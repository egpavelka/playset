class AddApiSrcToEmbeddeds < ActiveRecord::Migration[5.0]
  def change
    add_column :embeddeds, :api_source, :string
  end
end
