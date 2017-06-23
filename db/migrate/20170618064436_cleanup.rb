class Cleanup < ActiveRecord::Migration[5.1]
  def change
    remove_column :embeddeds, :player_url, :string
  end
end
