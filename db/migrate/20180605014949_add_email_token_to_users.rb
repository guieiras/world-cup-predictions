class AddEmailTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email_token, :string
    add_index :users, :email_token, unique: true
  end
end
