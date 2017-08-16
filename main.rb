# # Prueba de ruby
# # El objetivo de esta prueba es demostrar que se pueden
# # resolver problemas básicos utilizando ruby.
# # Los problemas a evaluar en esta prueba son del tipo abrir
# # un archivo, procesar información y luego guardar los
# # cambios en otro archivo.
# # Para procesar la información ocuparemos principalmente
# # Arrays y Hashes, y sus métodos más comunes, como
# # .each, .count y .map
# # Entender esta mecánica nos permitirá trabajar de forma
# # sencilla con bases de datos y mostrar los resultados que
# # necesitemos en nuestras aplicaciones web.
# # Buena suerte !!


# Comienza la prueba
# Se tiene un archivo (el cuál deben crear en su
# computador) llamado alumnos.csv con nombres de
# alumnos e información de notas.
# El archivo tiene el siguiente formato.
# Juan, 9, 2, 5
# Felipe, 10, 2, A
# Javiera, 10, A, 9
# Gonzalo, 10, 10, 10
# Donde la A señala que el alumno estuvo ausente en la
# prueba.
# Se pide:
# Construcción del menú [total: 2 puntos]
# Crear un menú con 5 opciones, se debe validar que la
# opción escogida sea 1, 2, 3, o 4, 5, si el usuario ingresa
# cualquier otra opción se debe mostrar que la opción
# es inválida, y mostrar el menú nuevamente y la opción
# de elegir. [1 punto]

# puts "1) " # Op 1:
# puts "2) " #Op2:
# puts "3) " #Op3:
# puts "4) " #Op4:
# puts "5) " #Op5:


# Si el usuario ingresa la opción 1 el programa muestra
# un mensaje de despedida y luego termina. [1 punto]

# puts "1) Salir" # Op 1: salir
# puts "2) " #Op2:
# puts "3) " #Op3:
# puts "4) " #Op4:
# puts "5) " #Op5:

#Creación de métodos y lectura de archivos [total: 2
# puntos]
# Si el usuario ingresa la opción 2, se debe devolver la
# cantidad de alumnos que hay en el archivo. [1 punto]

# puts "1) Salir" # Op 1: salir
# puts "2) Mostrar la cantidad total de alumnos " #Op2: # Si el usuario ingresa la opción 2, se debe devolver la cantidad de alumnos que hay en el archivo. [1 punto]
# puts "3) " #Op3:
# puts "4) " #Op4:
# puts "5) " #Op5:

# Para esto debe haber un método que reciba el
# nombre del archivo, el método se encarga de abrir,
# contar y cerrar y devuelve el número de líneas, el
# método debe llamar contar_lineas [1 pto]
def contar_lineas(filevar)
	file = File.open(filevar, 'r')
		datavar = file.readlines
	file.close

	return datavar
end
# Creación de objetos [total: 2 puntos]
# Crear la clase alumno, el constructor debe recibir un
# string con el nombre de alumnos y otros 3 strings que
# representan las notas. [1 punto]
# Dentro del constructor se debe guardar como variable
# de instancia el nombre, nota1, nota2 y nota3, las notas
# deben ser transformadas a números enteros, si el
# alumno estuvo inasistente la nota debe ser guardada
# como 0, además se debe crear una variable de
# instancia que cuenta la cantidad de inasistencias. [1
# punto]
# Ejemplo:
# 1
# Javier, A, 10, A
# Debe crear un objeto con:@nombre => "Javier"
# @nota1 => 0
# @nota2 => 10
# @nota3 => 0
# @inasistencias => 2
# Getters setters [total: 1 punto]
# Se deben crear getter y setter para el nombre, y para las
# inasistencias. [1 punto]
# Métodos de instancias [total: 1 punto]
# Se debe crear un método de instancia en el objeto que
# permita obtener el promedio a partir de sus notas. [1
# punto]
class Alumno
	attr_accessor :nombre, :nota1, :nota2, :nota3, :inasistencias, :notas
	def initialize(nombre, nota1, nota2, nota3)
		@nombre = nombre
		@nota1 = nota1.to_i
		@nota2 = nota2.to_i
		@nota3 = nota3.to_i
		@inasistencias = 0
		@notas = [ nota1.to_i, nota2.to_i, nota3.to_i ]
		@notas.each do |i|
			if i.to_i == 0 && i == "A"
				@inasistencias += 1
			end
		end
	end

	def promedio
		return (@nota1 + @nota2 + @nota3) / @notas.size.to_f
	end

	def to_s
		return "#{@nombre} - #{@nota1}, #{@nota2}, #{@nota3}"
	end

	def nombre_y_promedio
		"#{@nombre} - #{promedio}"
	end
end
# Mostrando los promedios[total: 2 puntos]
# Si el usuario presiona la opción 3 se debe mostrar los
# nombres de los alumnos y sus promedios

# puts "1) Salir" # Op 1: salir
# puts "2) Mostrar la cantidad total de alumnos " #Op2: # Si el usuario ingresa la opción 2, se debe devolver la cantidad de alumnos que hay en el archivo. [1 punto]
# puts "3) Ver promedio de los alumnos" #Op3: Ver promedio de los alumnos
# puts "4) " #Op4:
# puts "5) " #Op5:


# Se debe crear un método (fuera de la clase
# alumno) que abra el archivo y devuelva un arreglo de objetos alumnos. [1 punto]

def devolver_arr(data)
	arr = []
	data.each do |i|
		a = i.split(", ")
		arr << Alumno.new(a[0], a[1], a[2], a[3])
	end

	return arr
end
# Se debe llamar al método y luego iterar el
# arreglo devuelto mostrando el nombre y el
# promedio [1 punto]
# Guardar resultados en otro archivo [total: 1 punto]
# Si el usuario presiona la opción 4, se debe crear el
# archivo promedios.txt que guarde dentro de la
# información el nombre del alumno, el promedio y el
# número de inasistencias. [1 punto]

# puts "1) Salir" # Op 1: salir
# puts "2) Mostrar la cantidad total de alumnos " #Op2: # Si el usuario ingresa la opción 2, se debe devolver la cantidad de alumnos que hay en el archivo. [1 punto]
# puts "3) Ver promedio de los alumnos " #Op3: Ver promedio de los alumnos
# puts "4) Guardar estado de alumnos " #Op4: Guardar estado de alumnos
# puts "5) " #Op5:


# Buscando a los alumnos aprobados [total: 1 punto]
# Si el usuario presiona la opción 5, se debe mostrar en
# pantalla todos los alumnos cuya nota promedio sea
# mayor a 7.


# puts "1) Salir" # Op 1: salir
# puts "2) Mostrar la cantidad total de alumnos " #Op2: # Si el usuario ingresa la opción 2, se debe devolver la cantidad de alumnos que hay en el archivo. [1 punto]
# puts "3) Ver promedio de los alumnos " #Op3: Ver promedio de los alumnos
# puts "4) Guardar estado de alumnos " #Op4: Guardar estado de alumnos
# puts "5) Consultar por alumnos con promedio mayor a 7 " #Op5: Consultar por alumnos con promedio mayor a 7


# [1 punto]
# Se requieren 6 puntos para aprobar.


datas = contar_lineas('alumnos.csv')
alums = devolver_arr(datas)

# si elige 3
 # alums.each do |i|
 # 	puts i.nombre_y_promedio
 # end


puts "Elige una opcion"

puts "1) Salir" # Op 1: salir
puts "2) Mostrar la cantidad total de alumnos " #Op2: # Si el usuario ingresa la opción 2, se debe devolver la cantidad de alumnos que hay en el archivo. [1 punto]
puts "3) Ver promedio de los alumnos " #Op3: Ver promedio de los alumnos
puts "4) Guardar estado de alumnos " #Op4: Guardar estado de alumnos
puts "5) Consultar por alumnos con promedio mayor a 7 " #Op5: Consultar por alumnos con promedio mayor a 7

a = gets.chomp.to_i # gets an option

if a == 2 && a != 1
	puts "Hay #{alums.size} alumnos"
elsif a == 3 && a != 1
	alums.each do |i|
		puts i.nombre_y_promedio
	end
elsif a == 4 && a != 1
	file = File.open('promedios.txt', 'w')
	alums.each do |i|
		file.puts i.nombre_y_promedio
	end
	file.close
elsif a == 5 && a != 1
	alums.each do |i|
		puts "#{i.nombre} tiene un promedio de #{i.promedio} y estas notas: #{i.notas.to_s}" if i.promedio > 7.to_f
	end
else
	puts "Opcion no valida" unless a == 1
	puts "Nos vemos pronto!" unless a != 1
end

while a != 1
	puts "1) Salir" # Op 1: salir
	puts "2) Mostrar la cantidad total de alumnos " #Op2: # Si el usuario ingresa la opción 2, se debe devolver la cantidad de alumnos que hay en el archivo. [1 punto]
	puts "3) Ver promedio de los alumnos " #Op3: Ver promedio de los alumnos
	puts "4) Guardar estado de alumnos " #Op4: Guardar estado de alumnos
	puts "5) Consultar por alumnos con promedio mayor a 7 " #Op5: Consultar por alumnos con promedio mayor a 7
	a = gets.chomp.to_i

	if a == 2 && a != 1
		puts "Hay #{alums.size} alumnos"
	elsif a == 3 && a != 1
		alums.each do |i|
			puts i.nombre_y_promedio
		end
	elsif a == 4 && a != 1
		file = File.open('promedios.txt', 'w')
		alums.each do |i|
			file.puts i.nombre_y_promedio
		end
		file.close
	elsif a == 5 && a != 1
		alums.each do |i|
			puts "#{i.nombre} tiene un promedio de #{i.promedio} y estas notas: #{i.notas.to_s}" if i.promedio > 7.to_f
		end
	else
		puts "Opcion no valida" unless a == 1
		puts "Nos vemos pronto!" unless a != 1
	end
end