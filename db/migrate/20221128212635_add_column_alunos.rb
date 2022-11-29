class AddColumnAlunos < ActiveRecord::Migration[7.0]
  def change
      add_column :ambientes, :emails_alunos, :string
  end
end
