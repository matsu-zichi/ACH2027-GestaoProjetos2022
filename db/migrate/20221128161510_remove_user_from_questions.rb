class RemoveUserFromQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_reference :questions, :user_id, null: false, foreign_key: false
  end
end
