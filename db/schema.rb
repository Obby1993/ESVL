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

ActiveRecord::Schema[7.0].define(version: 2023_03_11_122042) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "titre"
    t.string "taille_disponible"
    t.string "genre"
    t.string "remarque"
    t.string "categorie"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "event_id"
    t.string "stripe_product_id"
    t.string "stripe_price_id"
    t.string "currency", default: "eur"
    t.integer "price"
    t.index ["event_id"], name: "index_articles_on_event_id"
  end

  create_table "commandes", force: :cascade do |t|
    t.bigint "article_id", null: false
    t.integer "quantité"
    t.string "taille"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "etat"
    t.integer "amount_cents", default: 0, null: false
    t.string "checkout_session_id"
    t.bigint "user_id"
    t.bigint "event_team_id"
    t.index ["article_id"], name: "index_commandes_on_article_id"
    t.index ["event_team_id"], name: "index_commandes_on_event_team_id"
    t.index ["user_id"], name: "index_commandes_on_user_id"
  end

  create_table "esvl_teams", force: :cascade do |t|
    t.integer "année"
    t.string "division"
    t.string "genre"
    t.string "coach"
    t.string "résultat"
    t.string "joueurs"
    t.string "autre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_teams", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.string "nom_equipe"
    t.string "niveau"
    t.string "nom_capitaine"
    t.string "email_capitaine"
    t.string "numero_capitaine"
    t.integer "nb_joueur"
    t.string "joueurs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_teams_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "nom"
    t.integer "nb_equipes"
    t.date "date_event"
    t.date "deadline_register"
    t.string "genre"
    t.string "autre"
    t.integer "nb_joueur_equipe"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fonction", null: false
    t.string "fullname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "commandes", "articles"
  add_foreign_key "commandes", "event_teams"
  add_foreign_key "commandes", "users"
  add_foreign_key "event_teams", "events"
  add_foreign_key "events", "users"
end
