class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.integer :question_id
      t.integer :user_id
      t.integer :score
      t.boolean :hasFinished

      t.timestamps
    end
  end
end
