class AddCategoriesTitleNullConstaint < ActiveRecord::Migration[6.0]
  def up
    change_column_null(:categories, :title, false)
  end

  def down
    change_column_null(:categories, :title, true)
  end
end
