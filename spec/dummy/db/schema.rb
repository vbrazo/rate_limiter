# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_30_194312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "processor_gateway_accounts", id: :string, limit: 36, force: :cascade do |t|
    t.string "processor", null: false
    t.jsonb "options", default: "{}", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "processor_gateway_card_products", id: :string, limit: 36, force: :cascade do |t|
    t.string "account_id", null: false
    t.string "processor_card_product_id", null: false
    t.string "payment_instrument_type", null: false
    t.string "accepted_currencies", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "processor_gateway_cards", id: :string, limit: 36, force: :cascade do |t|
    t.string "card_product_id", null: false
    t.string "processor_card_id", null: false
    t.string "pan"
    t.string "last4"
    t.jsonb "transaction_handler"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "metadata", default: {}
    t.jsonb "options", default: {}
  end

  create_table "processor_gateway_raw_requests", force: :cascade do |t|
    t.jsonb "json", default: {}, null: false
  end

  create_table "processor_gateway_transactions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "type", null: false
    t.uuid "parent_transaction_id"
    t.string "card_id", limit: 36, null: false
    t.json "transaction_handler", null: false
    t.string "transaction_handler_id"
    t.string "currency", limit: 3, null: false
    t.integer "amount_requested", null: false
    t.integer "amount_approved"
    t.string "merchant_trade_name", null: false
    t.string "mcc", limit: 4, null: false
    t.datetime "processor_datetime"
    t.datetime "created_at"
    t.string "processor_transaction_id", null: false
    t.string "card_acceptor_id"
    t.string "acquirer_id"
    t.string "terminal_id"
    t.index ["processor_transaction_id"], name: "index_processor_transaction_id"
  end

  add_foreign_key "processor_gateway_card_products", "processor_gateway_accounts", column: "account_id"
  add_foreign_key "processor_gateway_cards", "processor_gateway_card_products", column: "card_product_id"
  add_foreign_key "processor_gateway_transactions", "processor_gateway_cards", column: "card_id"
  add_foreign_key "processor_gateway_transactions", "processor_gateway_transactions", column: "parent_transaction_id"
end
