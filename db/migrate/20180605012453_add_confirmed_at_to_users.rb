class AddConfirmedAtToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :confirmed_at, :datetime
    User.update_all(confirmed_at: DateTime.current)
  end

  def down
    User.update_all(confirmed_at: nil)
    remove_column :users, :confirmed_at
  end
end
