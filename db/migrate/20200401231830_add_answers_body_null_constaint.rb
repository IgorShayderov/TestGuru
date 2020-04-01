class AddAnswersBodyNullConstaint < ActiveRecord::Migration[6.0]
  def up
    change_column_null(:answers, :body, false)
  end

  def down
    change_column_null(:answers, :body, true)
  end
end
