class AddTestsUsersReference < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :user, foreign_key: true
    add_index :tests, [:level, :title], unique: true
  end
end