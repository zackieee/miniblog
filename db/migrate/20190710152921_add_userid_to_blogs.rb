class AddUseridToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :user_id, :integer, null:false
  end
end
