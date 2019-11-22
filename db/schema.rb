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

ActiveRecord::Schema.define(version: 2019_11_22_144535) do

  create_table "cajas", force: :cascade do |t|
    t.date "fecha"
    t.float "fondo_inicial"
    t.integer "creador_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creador_id"], name: "index_cajas_on_creador_id"
  end

  create_table "canchas", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.integer "usuarios_id"
    t.float "precio_hora"
    t.float "costo_extra1"
    t.float "costo_extra2"
    t.string "condicion_extra1"
    t.string "condicion_extra2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuarios_id"], name: "index_canchas_on_usuarios_id"
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "direccion"
    t.string "email"
    t.string "telefono"
    t.date "fecha_nacimiento"
    t.integer "creador_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creador_id"], name: "index_clientes_on_creador_id"
  end

  create_table "horarios", force: :cascade do |t|
    t.string "nombre"
    t.date "fecha"
    t.string "hora_inicio"
    t.string "hora_fin"
    t.integer "creador_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creador_id"], name: "index_horarios_on_creador_id"
  end

  create_table "reservas", force: :cascade do |t|
    t.float "adelanto"
    t.datetime "fecha_inicio"
    t.datetime "fecha_fin"
    t.integer "cliente_id"
    t.integer "creador_id"
    t.integer "cancha_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cancha_id"], name: "index_reservas_on_cancha_id"
    t.index ["cliente_id"], name: "index_reservas_on_cliente_id"
    t.index ["creador_id"], name: "index_reservas_on_creador_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "nombre"
    t.string "apellido"
    t.string "telefono"
    t.string "direccion"
    t.string "ciudad"
    t.string "provincia"
    t.string "pais"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
