class Exam < ApplicationRecord
  belongs_to :ambiente
  validates :name, presence: true, uniqueness: true
  validates :num_questions, presence: true, uniqueness: true
  validates :exam_date, presence: true, uniqueness: true
  validates :exam_time, presence: true, uniqueness: true
end
