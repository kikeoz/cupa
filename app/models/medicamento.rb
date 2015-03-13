class Medicamento < ActiveRecord::Base
	#Validaciones Clave
	validates :med_id, :presence => {:message => "El campo CLAVE no puede estar vacio"}, length: {minimum: 1, maximum: 4, :message => "La CLAVE debe tener maximo 4 digitos"}, :uniqueness => {:message => "Usted ha ingresado una clave repetida"}
	#Validaciones Descripcion
	validates :med_nombre, :presence => {:message => "El campo DESCRIPCION no puede estar vacio"}
	#Validaciones Linea
	validates :med_linea, :presence => {:message => "El campo LINEA no puede estar vacio"}

end
