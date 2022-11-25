class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.string :name
      t.string :description
      t.integer :num_questions
      t.datetime :exam_date
      t.integer :exam_time
      t.references :ambiente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
