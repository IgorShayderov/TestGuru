class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.string :email, null: false
      t.string :text, null: false

      t.timestamps
    end
  end
end
