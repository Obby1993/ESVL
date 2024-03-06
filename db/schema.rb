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

ActiveRecord::Schema[7.0].define(version: 2023_05_25_090935) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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
    t.boolean "display", default: false
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

  create_table "documents", force: :cascade do |t|
    t.string "titre"
    t.integer "année"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "public_id"
  end

  create_table "employes", force: :cascade do |t|
    t.string "poste"
    t.string "nom"
    t.string "prenom"
    t.integer "année"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "niveau_employe"
  end

  create_table "entrainements", force: :cascade do |t|
    t.bigint "esvl_team_id"
    t.datetime "horaire_debut"
    t.datetime "horaire_fin"
    t.bigint "gymnase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jour"
    t.index ["esvl_team_id"], name: "index_entrainements_on_esvl_team_id"
    t.index ["gymnase_id"], name: "index_entrainements_on_gymnase_id"
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
    t.string "categorie"
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

  create_table "gymnases", force: :cascade do |t|
    t.string "nom"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "next_games", force: :cascade do |t|
    t.time "heure"
    t.string "lieu"
    t.string "team_a"
    t.string "team_b"
    t.string "division"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "day"
    t.bigint "esvl_team_id"
    t.index ["esvl_team_id"], name: "index_next_games_on_esvl_team_id"
  end

  create_table "partenaires", force: :cascade do |t|
    t.date "année"
    t.string "entreprise"
    t.string "contact"
    t.integer "numero"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "commandes", "articles"
  add_foreign_key "commandes", "event_teams"
  add_foreign_key "commandes", "users"
  add_foreign_key "entrainements", "esvl_teams"
  add_foreign_key "entrainements", "gymnases"
  add_foreign_key "event_teams", "events"
  add_foreign_key "events", "users"
  add_foreign_key "next_games", "esvl_teams"
end
