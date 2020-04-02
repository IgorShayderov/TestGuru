class AddAnswerBodyDefaultValue < ActiveRecord::Migration[6.0]
  def up
    change_column_default(:answers, :body, from: nil, to: 'Corrert!')
  end

  def down
    change_column_default(:answers, :body, from: 'Corrert!', to: nil)
  end
end
