class AddPlayerUrlToEmbeddeds < ActiveRecord::Migration[5.0]
  def change
    add_column :embeddeds, :player_url, :string
  end
end
