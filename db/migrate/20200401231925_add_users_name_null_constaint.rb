class AddUsersNameNullConstaint < ActiveRecord::Migration[6.0]
  def up
    change_column_null(:users, :name, false)
  end

  def down
    change_column_null(:users, :name, true)
  end
end
