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

ActiveRecord::Schema.define(version: 2021_12_02_084029) do

  create_table "addresses", options: "CREATE TABLE \"addresses\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"typeAddress\" varchar(255) NOT NULL,\n  \"status\" varchar(255) NOT NULL,\n  \"entity\" varchar(255) NOT NULL,\n  \"numberAndStreet\" varchar(255) NOT NULL,\n  \"suiteOrApartment\" varchar(255) NOT NULL,\n  \"city\" varchar(255) NOT NULL,\n  \"postalCode\" varchar(255) NOT NULL,\n  \"country\" varchar(255) NOT NULL,\n  \"notes\" varchar(255) NOT NULL,\n  \"lat\" float NOT NULL,\n  \"long\" float NOT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  PRIMARY KEY (\"id\")\n)", force: :cascade do |t|
    t.string "typeAddress", null: false
    t.string "status", null: false
    t.string "entity", null: false
    t.string "numberAndStreet", null: false
    t.string "suiteOrApartment", null: false
    t.string "city", null: false
    t.string "postalCode", null: false
    t.string "country", null: false
    t.string "notes", null: false
    t.float "lat", null: false
    t.float "long", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "batteries", options: "CREATE TABLE \"batteries\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"buildingId\" bigint NOT NULL,\n  \"types\" varchar(255) NOT NULL,\n  \"status\" varchar(255) NOT NULL,\n  \"employeeId\" int NOT NULL,\n  \"dateCommissioning\" datetime NOT NULL,\n  \"dateLastInspection\" datetime NOT NULL,\n  \"certificateOperations\" varchar(255) NOT NULL,\n  \"information\" varchar(255) NOT NULL,\n  \"notes\" varchar(255) NOT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"fk_rails_a41b912b01\" (\"buildingId\"),\n  KEY \"fk_rails_b3952b46cb\" (\"employeeId\"),\n  CONSTRAINT \"fk_rails_a41b912b01\" FOREIGN KEY (\"buildingId\") REFERENCES \"buildings\" (\"id\"),\n  CONSTRAINT \"fk_rails_b3952b46cb\" FOREIGN KEY (\"employeeId\") REFERENCES \"employees\" (\"id\")\n)", force: :cascade do |t|
    t.bigint "buildingId", null: false
    t.string "types", null: false
    t.string "status", null: false
    t.integer "employeeId", null: false
    t.datetime "dateCommissioning", null: false
    t.datetime "dateLastInspection", null: false
    t.string "certificateOperations", null: false
    t.string "information", null: false
    t.string "notes", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buildingId"], name: "fk_rails_a41b912b01"
    t.index ["employeeId"], name: "fk_rails_b3952b46cb"
  end

  create_table "building_details", options: "CREATE TABLE \"building_details\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"buildingId\" bigint NOT NULL,\n  \"informationKey\" varchar(255) NOT NULL,\n  \"value\" varchar(255) NOT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"fk_rails_639c920861\" (\"buildingId\"),\n  CONSTRAINT \"fk_rails_639c920861\" FOREIGN KEY (\"buildingId\") REFERENCES \"buildings\" (\"id\")\n)", force: :cascade do |t|
    t.bigint "buildingId", null: false
    t.string "informationKey", null: false
    t.string "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buildingId"], name: "fk_rails_639c920861"
  end

  create_table "buildings", options: "CREATE TABLE \"buildings\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"customerId\" bigint NOT NULL,\n  \"addressId\" bigint NOT NULL,\n  \"fullNameAdministrator\" varchar(255) NOT NULL,\n  \"emailAdministrator\" varchar(255) NOT NULL,\n  \"phoneNumberAdministrator\" varchar(255) NOT NULL,\n  \"fullNameTechnicalContact\" varchar(255) NOT NULL,\n  \"emailTechnicalContact\" varchar(255) NOT NULL,\n  \"phoneTechnicalContact\" varchar(255) NOT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"fk_rails_1a4fe0cf30\" (\"addressId\"),\n  KEY \"fk_rails_e804dec3ca\" (\"customerId\"),\n  CONSTRAINT \"fk_rails_1a4fe0cf30\" FOREIGN KEY (\"addressId\") REFERENCES \"addresses\" (\"id\"),\n  CONSTRAINT \"fk_rails_e804dec3ca\" FOREIGN KEY (\"customerId\") REFERENCES \"customers\" (\"id\")\n)", force: :cascade do |t|
    t.bigint "customerId", null: false
    t.bigint "addressId", null: false
    t.string "fullNameAdministrator", null: false
    t.string "emailAdministrator", null: false
    t.string "phoneNumberAdministrator", null: false
    t.string "fullNameTechnicalContact", null: false
    t.string "emailTechnicalContact", null: false
    t.string "phoneTechnicalContact", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressId"], name: "fk_rails_1a4fe0cf30"
    t.index ["customerId"], name: "fk_rails_e804dec3ca"
  end

  create_table "columns", options: "CREATE TABLE \"columns\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"batteryId\" bigint NOT NULL,\n  \"types\" varchar(255) NOT NULL,\n  \"numberFloorServed\" varchar(255) NOT NULL,\n  \"status\" varchar(255) NOT NULL,\n  \"information\" varchar(255) NOT NULL,\n  \"notes\" varchar(255) NOT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"fk_rails_5c0968a3ea\" (\"batteryId\"),\n  CONSTRAINT \"fk_rails_5c0968a3ea\" FOREIGN KEY (\"batteryId\") REFERENCES \"batteries\" (\"id\")\n)", force: :cascade do |t|
    t.bigint "batteryId", null: false
    t.string "types", null: false
    t.string "numberFloorServed", null: false
    t.string "status", null: false
    t.string "information", null: false
    t.string "notes", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batteryId"], name: "fk_rails_5c0968a3ea"
  end

  create_table "customers", options: "CREATE TABLE \"customers\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"userId\" int NOT NULL,\n  \"dateCreation\" datetime NOT NULL,\n  \"compagnyName\" varchar(255) NOT NULL,\n  \"addressId\" bigint NOT NULL,\n  \"fullName\" varchar(255) NOT NULL,\n  \"contactPhone\" varchar(255) NOT NULL,\n  \"email\" varchar(255) NOT NULL,\n  \"description\" varchar(255) NOT NULL,\n  \"fullNameTechnicalAuthority\" varchar(255) NOT NULL,\n  \"technicalAuthorityPhone\" varchar(255) NOT NULL,\n  \"technicalAuthorityEmail\" varchar(255) NOT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"fk_rails_835ae73a22\" (\"userId\"),\n  KEY \"fk_rails_71c8d57845\" (\"addressId\"),\n  CONSTRAINT \"fk_rails_71c8d57845\" FOREIGN KEY (\"addressId\") REFERENCES \"addresses\" (\"id\"),\n  CONSTRAINT \"fk_rails_835ae73a22\" FOREIGN KEY (\"userId\") REFERENCES \"users\" (\"id\")\n)", force: :cascade do |t|
    t.integer "userId", null: false
    t.datetime "dateCreation", null: false
    t.string "compagnyName", null: false
    t.bigint "addressId", null: false
    t.string "fullName", null: false
    t.string "contactPhone", null: false
    t.string "email", null: false
    t.string "description", null: false
    t.string "fullNameTechnicalAuthority", null: false
    t.string "technicalAuthorityPhone", null: false
    t.string "technicalAuthorityEmail", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressId"], name: "fk_rails_71c8d57845"
    t.index ["userId"], name: "fk_rails_835ae73a22"
  end

  create_table "elevators", options: "CREATE TABLE \"elevators\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"columnId\" bigint NOT NULL,\n  \"serialNumber\" varchar(255) NOT NULL,\n  \"model\" varchar(255) NOT NULL,\n  \"types\" varchar(255) NOT NULL,\n  \"status\" varchar(255) NOT NULL,\n  \"dateCommissioning\" datetime NOT NULL,\n  \"dateLastInspection\" datetime NOT NULL,\n  \"certificateOperations\" varchar(255) NOT NULL,\n  \"information\" varchar(255) NOT NULL,\n  \"notes\" varchar(255) NOT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"fk_rails_51711cce16\" (\"columnId\"),\n  CONSTRAINT \"fk_rails_51711cce16\" FOREIGN KEY (\"columnId\") REFERENCES \"columns\" (\"id\")\n)", force: :cascade do |t|
    t.bigint "columnId", null: false
    t.string "serialNumber", null: false
    t.string "model", null: false
    t.string "types", null: false
    t.string "status", null: false
    t.datetime "dateCommissioning", null: false
    t.datetime "dateLastInspection", null: false
    t.string "certificateOperations", null: false
    t.string "information", null: false
    t.string "notes", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["columnId"], name: "fk_rails_51711cce16"
  end

  create_table "employees", id: :integer, options: "CREATE TABLE \"employees\" (\n  \"id\" int NOT NULL AUTO_INCREMENT,\n  \"first_name\" varchar(255) NOT NULL,\n  \"last_name\" varchar(255) NOT NULL,\n  \"title\" varchar(255) NOT NULL,\n  \"email\" varchar(255) NOT NULL,\n  \"user_id\" int NOT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"fk_rails_dcfd3d4fc3\" (\"user_id\"),\n  CONSTRAINT \"fk_rails_dcfd3d4fc3\" FOREIGN KEY (\"user_id\") REFERENCES \"users\" (\"id\")\n)", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "title", null: false
    t.string "email", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "fk_rails_dcfd3d4fc3"
  end

  create_table "interventions", options: "CREATE TABLE \"interventions\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"author\" bigint NOT NULL,\n  \"customer_id\" bigint NOT NULL,\n  \"building_id\" bigint NOT NULL,\n  \"battery_id\" bigint NOT NULL,\n  \"column_id\" bigint DEFAULT NULL,\n  \"elevator_id\" bigint DEFAULT NULL,\n  \"employee_id\" int DEFAULT NULL,\n  \"start_of_intervention\" datetime DEFAULT NULL,\n  \"end_of_intervention\" datetime DEFAULT NULL,\n  \"result\" varchar(255) DEFAULT 'Incomplete',\n  \"report\" varchar(255) DEFAULT NULL,\n  \"status\" varchar(255) DEFAULT 'Pending',\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"fk_rails_911b4ef939\" (\"building_id\"),\n  KEY \"fk_rails_268aede6d6\" (\"battery_id\"),\n  KEY \"fk_rails_d05fb241b3\" (\"column_id\"),\n  KEY \"fk_rails_11b5a4bd36\" (\"elevator_id\"),\n  KEY \"fk_rails_2e0d31b7ad\" (\"employee_id\"),\n  KEY \"fk_rails_4242c0f569\" (\"customer_id\"),\n  CONSTRAINT \"fk_rails_11b5a4bd36\" FOREIGN KEY (\"elevator_id\") REFERENCES \"elevators\" (\"id\"),\n  CONSTRAINT \"fk_rails_268aede6d6\" FOREIGN KEY (\"battery_id\") REFERENCES \"batteries\" (\"id\"),\n  CONSTRAINT \"fk_rails_2e0d31b7ad\" FOREIGN KEY (\"employee_id\") REFERENCES \"employees\" (\"id\"),\n  CONSTRAINT \"fk_rails_4242c0f569\" FOREIGN KEY (\"customer_id\") REFERENCES \"customers\" (\"id\"),\n  CONSTRAINT \"fk_rails_911b4ef939\" FOREIGN KEY (\"building_id\") REFERENCES \"buildings\" (\"id\"),\n  CONSTRAINT \"fk_rails_d05fb241b3\" FOREIGN KEY (\"column_id\") REFERENCES \"columns\" (\"id\")\n)", force: :cascade do |t|
    t.bigint "author", null: false
    t.bigint "customer_id", null: false
    t.bigint "building_id", null: false
    t.bigint "battery_id", null: false
    t.bigint "column_id"
    t.bigint "elevator_id"
    t.integer "employee_id"
    t.datetime "start_of_intervention"
    t.datetime "end_of_intervention"
    t.string "result", default: "Incomplete"
    t.string "report"
    t.string "status", default: "Pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["battery_id"], name: "fk_rails_268aede6d6"
    t.index ["building_id"], name: "fk_rails_911b4ef939"
    t.index ["column_id"], name: "fk_rails_d05fb241b3"
    t.index ["customer_id"], name: "fk_rails_4242c0f569"
    t.index ["elevator_id"], name: "fk_rails_11b5a4bd36"
    t.index ["employee_id"], name: "fk_rails_2e0d31b7ad"
  end

  create_table "leads", options: "CREATE TABLE \"leads\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"fullNameContact\" varchar(255) NOT NULL,\n  \"compagnyName\" varchar(255) NOT NULL,\n  \"email\" varchar(255) NOT NULL,\n  \"phoneNumber\" varchar(255) NOT NULL,\n  \"nameProject\" varchar(255) NOT NULL,\n  \"descriptionProject\" varchar(255) NOT NULL,\n  \"department\" varchar(255) NOT NULL,\n  \"message\" varchar(255) NOT NULL,\n  \"file\" blob,\n  \"date\" datetime NOT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  PRIMARY KEY (\"id\")\n)", force: :cascade do |t|
    t.string "fullNameContact", null: false
    t.string "compagnyName", null: false
    t.string "email", null: false
    t.string "phoneNumber", null: false
    t.string "nameProject", null: false
    t.string "descriptionProject", null: false
    t.string "department", null: false
    t.string "message", null: false
    t.binary "file"
    t.datetime "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", id: :integer, options: "CREATE TABLE \"quotes\" (\n  \"id\" int NOT NULL AUTO_INCREMENT,\n  \"type_building\" varchar(255) NOT NULL,\n  \"numApartment\" int DEFAULT NULL,\n  \"numFloor\" int DEFAULT NULL,\n  \"numElevator\" int DEFAULT NULL,\n  \"numOccupant\" int DEFAULT NULL,\n  \"compagnyName\" varchar(255) DEFAULT NULL,\n  \"email\" varchar(255) DEFAULT NULL,\n  \"typeService\" varchar(255) DEFAULT NULL,\n  \"totalElevatorPrice\" decimal(10,0) DEFAULT NULL,\n  \"total\" decimal(10,0) DEFAULT NULL,\n  \"installationFees\" decimal(10,0) DEFAULT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  PRIMARY KEY (\"id\")\n)", force: :cascade do |t|
    t.string "type_building", null: false
    t.integer "numApartment"
    t.integer "numFloor"
    t.integer "numElevator"
    t.integer "numOccupant"
    t.string "compagnyName"
    t.string "email"
    t.string "typeService"
    t.decimal "totalElevatorPrice", precision: 10
    t.decimal "total", precision: 10
    t.decimal "installationFees", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :integer, options: "CREATE TABLE \"users\" (\n  \"id\" int NOT NULL AUTO_INCREMENT,\n  \"email\" varchar(255) NOT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  \"encrypted_password\" varchar(255) NOT NULL DEFAULT '',\n  \"reset_password_token\" varchar(255) DEFAULT NULL,\n  \"reset_password_sent_at\" datetime DEFAULT NULL,\n  \"remember_created_at\" datetime DEFAULT NULL,\n  PRIMARY KEY (\"id\"),\n  UNIQUE KEY \"index_users_on_email\" (\"email\"),\n  UNIQUE KEY \"index_users_on_reset_password_token\" (\"reset_password_token\")\n)", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "batteries", "buildings", column: "buildingId"
  add_foreign_key "batteries", "employees", column: "employeeId"
  add_foreign_key "building_details", "buildings", column: "buildingId"
  add_foreign_key "buildings", "addresses", column: "addressId"
  add_foreign_key "buildings", "customers", column: "customerId"
  add_foreign_key "columns", "batteries", column: "batteryId"
  add_foreign_key "customers", "addresses", column: "addressId"
  add_foreign_key "customers", "users", column: "userId"
  add_foreign_key "elevators", "columns", column: "columnId"
  add_foreign_key "employees", "users"
  add_foreign_key "interventions", "batteries"
  add_foreign_key "interventions", "buildings"
  add_foreign_key "interventions", "columns"
  add_foreign_key "interventions", "customers"
  add_foreign_key "interventions", "elevators"
  add_foreign_key "interventions", "employees"
end
