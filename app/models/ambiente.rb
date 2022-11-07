class Ambiente < ApplicationRecord
  belongs_to :user
  validates :nome, presence: true, uniqueness: true
end
