class RenameBlogToPost < ActiveRecord::Migration[5.2]
  def change
    rename_table :blogs, :posts
  end
end
