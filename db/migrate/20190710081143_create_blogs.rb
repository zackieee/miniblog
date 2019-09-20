class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string     :blog_name, null:false
      t.text       :blog_introduction
      t.string     :image
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
