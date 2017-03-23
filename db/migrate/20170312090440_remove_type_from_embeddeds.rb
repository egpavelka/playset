class RemoveTypeFromEmbeddeds < ActiveRecord::Migration[5.0]
  def change
    remove_column :embeddeds, :type, :string
    remove_column :uploads, :type, :string
  end
end
