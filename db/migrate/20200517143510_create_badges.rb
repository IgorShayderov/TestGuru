class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title, unique: true, null: false
      t.string :icon, null: false
      t.string :condition, null: false

      t.timestamps
    end
  end
end
