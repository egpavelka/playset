class RemoveApiSrcsReferenceFromEmbeddeds < ActiveRecord::Migration[5.0]
  def change
    remove_reference :embeddeds, :api_src, polymorphic: true
  end
end
