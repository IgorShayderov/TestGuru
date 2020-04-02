class AddTestsLevelNullConstaint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:tests, :level, false)
  end
end
