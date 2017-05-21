
class PreguntaRespuesta < StandardError
end


class JuegoPR

	def initialize
		puts "Bienvenido a reto 5, Para jugar, solo ingresa el termino correcto para cada una de las definiciones, Listo? Vamos!\n\n"
		@listado_preguntas = []
		cargar_preguntas
	end


	def tamano_listado_preguntas
		return @listado_preguntas.length
	end



	def hacerPreguntas numpre

		lp = @listado_preguntas[numpre]
		puts ":: Pregunta ##{lp[:numero]}: #{lp[:pregunta]}"
		pal = gets.chomp

		raise PreguntaRespuesta.new("Incorrecto!, Trata de nuevo\n\n") unless pal == lp[:respuesta] || pal == 'me rindo'
	end


	private
	def cargar_preguntas doc_preguntas="preguntasyrespuestas.txt"

		if File.exists?(doc_preguntas)
			f = File.read(doc_preguntas) 

		  f.each_line do |busqueda_pregunta|
		    num, pregunta, respuesta = busqueda_pregunta.chomp.split(',')
		    @listado_preguntas << { numero: num.to_i, pregunta: pregunta, respuesta: respuesta }
		  end

		  return @listado_preguntas

		else
			"No existe el archivo de preguntas"
		end
	end


end


juego = JuegoPR.new

total_preguntas = juego.tamano_listado_preguntas

total_preguntas.times do |num_pregunta|
	respuesta = false

	while respuesta != true

		begin 
		
		juego.hacerPreguntas num_pregunta

		rescue PreguntaRespuesta => error
			puts "#{error}"

		else
			puts "Correcto!\n\n"
			respuesta = true	
 		end
		
	end
		
end
	