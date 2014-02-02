# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140201035818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alunos", force: true do |t|
    t.integer  "turma_id"
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "materias", force: true do |t|
    t.string   "nome"
    t.integer  "professor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professores", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "provas", force: true do |t|
    t.integer  "aluno_id"
    t.integer  "materia_id"
    t.decimal  "nota1",      default: 0.0
    t.decimal  "nota2",      default: 0.0
    t.decimal  "nota3",      default: 0.0
    t.decimal  "nota4",      default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "turma_materias", force: true do |t|
    t.integer  "turma_id"
    t.integer  "materia_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "turmas", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
