class Ambiente < ApplicationRecord
  belongs_to :user
  has_many :exams, dependent: :destroy
  validates :nome, presence: true, uniqueness: true
end
