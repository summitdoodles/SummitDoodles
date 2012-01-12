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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110913185719) do

  create_table "breeds", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "breeds", ["name"], :name => "index_breeds_on_name", :unique => true

  create_table "charge_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "charge_types", ["name"], :name => "index_charge_types_on_name", :unique => true

  create_table "charges", :force => true do |t|
    t.date     "date"
    t.decimal  "amount",         :precision => 8, :scale => 2
    t.integer  "charge_type_id"
    t.integer  "puppy_id"
    t.integer  "client_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "charges", ["client_id"], :name => "index_charges_on_client_id"
  add_index "charges", ["date"], :name => "index_charges_on_date"
  add_index "charges", ["puppy_id"], :name => "index_charges_on_puppy_id"

  create_table "clients", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.integer  "state_id"
    t.string   "zip"
    t.string   "email"
    t.string   "phone_number"
    t.string   "secondary_phone_number"
    t.integer  "gender_id"
    t.boolean  "will_be_referal",        :default => false
    t.text     "reference"
    t.text     "notes"
    t.integer  "email_priority_id"
    t.boolean  "do_not_email",           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clients", ["do_not_email"], :name => "index_clients_on_do_not_email"
  add_index "clients", ["email_priority_id"], :name => "index_clients_on_email_priority_id"
  add_index "clients", ["last_name"], :name => "index_clients_on_last_name", :unique => true

  create_table "colors", :force => true do |t|
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "colors", ["color"], :name => "index_colors_on_color", :unique => true

  create_table "dames", :force => true do |t|
    t.string   "name"
    t.date     "birthday"
    t.boolean  "active",     :default => false
    t.integer  "breed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_priorities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "email_priorities", ["name"], :name => "index_email_priorities_on_name", :unique => true

  create_table "expense_tax_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "expense_tax_types", ["name"], :name => "index_expense_tax_types_on_name", :unique => true

  create_table "expense_types", :force => true do |t|
    t.string   "name"
    t.integer  "expense_tax_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "expense_types", ["name"], :name => "index_expense_types_on_name", :unique => true

  create_table "expenses", :force => true do |t|
    t.integer  "expense_type_id"
    t.string   "name"
    t.decimal  "amount",          :precision => 8, :scale => 2
    t.date     "date"
    t.integer  "litter_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "expenses", ["litter_id"], :name => "index_expenses_on_litter_id"

  create_table "genders", :force => true do |t|
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "genders", ["gender"], :name => "index_genders_on_gender", :unique => true

  create_table "heat_cycles", :force => true do |t|
    t.date     "date"
    t.integer  "dame_id"
    t.string   "in_heat"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "heat_cycles", ["date"], :name => "index_heat_cycles_on_date"

  create_table "litters", :force => true do |t|
    t.date     "birthday"
    t.integer  "sire_id"
    t.integer  "dame_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "litters", ["birthday"], :name => "index_litters_on_birthday"

  create_table "payments", :force => true do |t|
    t.date     "date"
    t.decimal  "amount",     :precision => 8, :scale => 2
    t.integer  "client_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["client_id"], :name => "index_payments_on_client_id"
  add_index "payments", ["date"], :name => "index_payments_on_date"

  create_table "puppies", :force => true do |t|
    t.string   "name"
    t.integer  "gender_id"
    t.integer  "color_id"
    t.date     "date_sold"
    t.integer  "litter_id"
    t.string   "collar_color_name"
    t.integer  "client_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "puppies", ["name"], :name => "index_puppies_on_name"

  create_table "relations", :force => true do |t|
    t.string   "relation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relations", ["relation"], :name => "index_relations_on_relation", :unique => true

  create_table "sires", :force => true do |t|
    t.string   "name"
    t.date     "birthday"
    t.boolean  "active",     :default => false
    t.integer  "breed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.string   "short_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "states", ["name"], :name => "index_states_on_name", :unique => true
  add_index "states", ["short_name"], :name => "index_states_on_short_name", :unique => true

  create_table "support_clients", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.integer  "relation_id"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "support_clients", ["client_id"], :name => "index_support_clients_on_client_id"
  add_index "support_clients", ["last_name"], :name => "index_support_clients_on_last_name"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "weights", :force => true do |t|
    t.date     "date"
    t.integer  "lb"
    t.integer  "oz"
    t.integer  "puppy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "weights", ["date"], :name => "index_weights_on_date"

end
