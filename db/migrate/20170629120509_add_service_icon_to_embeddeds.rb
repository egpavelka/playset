class AddServiceIconToEmbeddeds < ActiveRecord::Migration[5.1]
  def change
    add_column :embeddeds, :service_icon, :string
  end
end
