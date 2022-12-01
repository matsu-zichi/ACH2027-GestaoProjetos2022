class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :ambientes , dependent: :destroy

  enum role: [:Aluno, :Professor]
  after_initialize :set_Default_role, :if => :new_record?
  def set_Default_role
    self.role ||= :Aluno
  end
end
