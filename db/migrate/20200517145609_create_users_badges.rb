class CreateUsersBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :users_badges do |t|
      t.references :user, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true
      t.references :test_passage, null: false, foreign_key: true

      t.timestamps
    end
  end
end
