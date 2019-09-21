class AddNameToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :name, :string
    add_column :users, :image, :string
    add_column :users, :introduction, :text
  end
end
