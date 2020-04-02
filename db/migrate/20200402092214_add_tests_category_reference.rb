class AddTestsCategoryReference < ActiveRecord::Migration[6.0]
  def change
    add_reference(:tests, :categories, foreign_key: true)
  end
end
