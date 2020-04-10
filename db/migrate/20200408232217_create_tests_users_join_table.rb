class CreateTestsUsersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :tests do |t|
      t.string :result
      t.index [:user_id, :test_id], unique: true
      # t.index [:test_id, :user_id]

      t.timestamps
    end
  end
end
