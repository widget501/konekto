class AddFieldToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :user_name, :string
    add_column :users, :bio, :text
  end
end
