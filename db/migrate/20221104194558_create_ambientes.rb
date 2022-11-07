class CreateAmbientes < ActiveRecord::Migration[7.0]
  def change
    create_table :ambientes do |t|
      t.string :nome
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
