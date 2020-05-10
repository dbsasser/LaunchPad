class AddInfoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :photo, :string, :default => 'default_avatar.png'
  end
end
