class Exam < ApplicationRecord

  belongs_to :ambiente
  has_many :questions

  validates :name, presence: true
  validates :num_questions, presence: true
  validates :exam_date, presence: true
  validates :exam_time, presence: true
end
