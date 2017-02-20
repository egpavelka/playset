class AddFileSrcToUploads < ActiveRecord::Migration[5.0]
  def change
    add_column :uploads, :file_src, :string
  end
end
