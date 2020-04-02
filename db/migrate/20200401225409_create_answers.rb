class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :body
      t.integer :test_id
      t.correct :boolean

      t.timestamps
    end
  end
end
