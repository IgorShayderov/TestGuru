class CreateUsersBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :users_badges do |t|
      t.references :user, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true
      t.integer :count, default: 0

      t.timestamps
    end
  end
end