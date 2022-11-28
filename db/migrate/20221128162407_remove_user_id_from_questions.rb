class RemoveUserIdFromQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions, :user_id, :integer
  end
end
