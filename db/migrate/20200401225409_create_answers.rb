class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :body
      t.integer :test_id
      t.boolean :correct

      t.timestamps
    end
    add_reference :answers, :questions, foreign_key: true
  end
end