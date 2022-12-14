# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_28_212635) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ambientes", force: :cascade do |t|
    t.string "nome"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "emails_alunos"
    t.index ["user_id"], name: "index_ambientes_on_user_id"
  end

  create_table "exams", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "num_questions"
    t.datetime "exam_date"
    t.integer "exam_time"
    t.bigint "ambiente_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ambiente_id"], name: "index_exams_on_ambiente_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "descricao"
    t.string "tipo"
    t.string "dificuldade"
    t.string "resposta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "exam_id", null: false
    t.index ["exam_id"], name: "index_questions_on_exam_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ambientes", "users"
  add_foreign_key "exams", "ambientes"
  add_foreign_key "questions", "exams"
end
