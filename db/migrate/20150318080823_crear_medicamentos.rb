class CrearMedicamentos < ActiveRecord::Migration
  def change
    create_table :medicamentos do |t|
      t.integer :med_id
      t.string :med_nombre
      t.string :med_linea

  		end
    end
end
