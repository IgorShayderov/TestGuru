class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :body
      t.integer(:test_id).references(:tests)

      t.timestamps
    end
  end
end
