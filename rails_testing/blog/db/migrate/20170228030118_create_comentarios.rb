class CreateComentarios < ActiveRecord::Migration[5.0]
  def change
    create_table :comentarios do |t|
      t.string :comentarista
      t.text :contenido

      t.references :articulo, index: true
      t.timestamps null: false

    end
  	add_foreign_key :comentarios, :articulos
  end

end
