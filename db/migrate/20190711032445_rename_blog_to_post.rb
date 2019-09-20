class RenameBlogToPost < ActiveRecord::Migration[5.2]
  def up
    rename_table :blogs, :posts
  end
end
