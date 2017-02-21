class AddApiSrcToEmbedded < ActiveRecord::Migration[5.0]
  def change
    add_reference :embeddeds, :api_src, polymorphic: true
  end
end
