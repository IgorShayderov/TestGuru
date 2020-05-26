class AddBadgesIndex < ActiveRecord::Migration[6.0]
  def change
    add_index :badges, %i[condition condition_param], unique: true
  end
end
