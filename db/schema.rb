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

ActiveRecord::Schema.define(version: 2019_11_30_002634) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "articulos", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.string "codigo"
    t.float "precio_compra"
    t.float "precio_venta"
    t.float "margen"
    t.float "descuento"
    t.string "tipo_descuento"
    t.integer "cantidad"
    t.integer "creador_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "imagen_file_name"
    t.string "imagen_content_type"
    t.bigint "imagen_file_size"
    t.datetime "imagen_updated_at"
    t.index ["creador_id"], name: "index_articulos_on_creador_id"
  end

  create_table "articulos_compra", force: :cascade do |t|
    t.integer "articulo_id"
    t.string "origen_compra_type"
    t.integer "origen_compra_id"
    t.float "precio_anterior"
    t.float "precio_actual"
    t.integer "cantidad"
    t.integer "status"
    t.integer "creador_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["articulo_id"], name: "index_articulos_compra_on_articulo_id"
    t.index ["creador_id"], name: "index_articulos_compra_on_creador_id"
    t.index ["origen_compra_type", "origen_compra_id"], name: "origen_de_compra"
  end

  create_table "articulos_proveedores", id: false, force: :cascade do |t|
    t.integer "articulo_id", null: false
    t.integer "proveedor_id", null: false
    t.integer "creador_id"
    t.index ["articulo_id", nil], name: "index_articulos_proveedores_on_articulo_id_and_proveedore_id"
    t.index ["creador_id"], name: "index_articulos_proveedores_on_creador_id"
    t.index [nil, "articulo_id"], name: "index_articulos_proveedores_on_proveedore_id_and_articulo_id"
  end

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
    t.integer "creador_id"
    t.float "precio_hora"
    t.float "costo_extra1"
    t.float "costo_extra2"
    t.json "condicion_extra1"
    t.json "condicion_extra2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creador_id"], name: "index_canchas_on_creador_id"
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

  create_table "compras", force: :cascade do |t|
    t.integer "status"
    t.float "precio_total"
    t.integer "creador_id"
    t.integer "proveedor_id"
    t.integer "caja_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "orden_de_compra_id"
    t.float "precio_actual"
    t.index ["caja_id"], name: "index_compras_on_caja_id"
    t.index ["creador_id"], name: "index_compras_on_creador_id"
    t.index ["orden_de_compra_id"], name: "index_compras_on_orden_de_compra_id"
    t.index ["proveedor_id"], name: "index_compras_on_proveedor_id"
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

  create_table "ordenes_de_compra", force: :cascade do |t|
    t.integer "creador_id"
    t.string "nota"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creador_id"], name: "index_ordenes_de_compra_on_creador_id"
  end

  create_table "proveedores", force: :cascade do |t|
    t.string "nombre"
    t.string "direccion"
    t.string "telefono"
    t.string "contacto"
    t.string "email"
    t.string "sitio_web"
    t.integer "creador_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creador_id"], name: "index_proveedores_on_creador_id"
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
    t.integer "rol", default: 0
  end

  create_table "vendibles_venta", force: :cascade do |t|
    t.integer "venta_id"
    t.integer "creador_id"
    t.string "vendible_type"
    t.integer "vendible_id"
    t.integer "cantidad"
    t.float "subtotal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creador_id"], name: "index_vendibles_venta_on_creador_id"
    t.index ["vendible_type", "vendible_id"], name: "index_vendibles_venta_on_vendible_type_and_vendible_id"
    t.index ["venta_id"], name: "index_vendibles_venta_on_venta_id"
  end

  create_table "ventas", force: :cascade do |t|
    t.float "total"
    t.string "nota"
    t.integer "creador_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.integer "caja_id"
    t.index ["caja_id"], name: "index_ventas_on_caja_id"
    t.index ["creador_id"], name: "index_ventas_on_creador_id"
  end

end
