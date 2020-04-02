class AddTestsTitleDefaultValue < ActiveRecord::Migration[6.0]
  def up
    change_column_default(:tests, :title, from: nil, to: 'Test')
  end

  def down
    change_column_default(:tests, :title, from: 'Test', to: nil)
  end
end
