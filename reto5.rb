# # Reto 5
# 1- iniciar juego
#   reiniciar variables y puntaje
# 2- mostrar definicion
# 3- recibir respuesta
# 4- comparar respuesta
#     si respuesta es correcta:
#         aumentar contador puntaje
#         validar si numero de definicion es igual a 5
#             si -> terminar juego y mostrar puntaje final
#             No -> continuar con la siguiente pregunta
#     si respuesta NO es correcta:
#         validar si numero de definicion es igual a 5
#             si -> terminar juego y mostrar puntaje final
#             No -> continuar con la siguiente pregunta

# Modelo de datos
# Clase Game: crea un nuevo juego
# Usuario, score, metodo get definition
# Modulo Definitions: Se creara cada vez que se inicie un juego y cargara las definciones y respuestas de un archivo

# require file where is the module Definitions
require_relative 'game'
# Mensaje de bienvenida
p '*' * 31
p '*' * 5 + ' BIENVENIDO A RETO 5 ' + '*' * 5
p '*' * 31
p ''
p 'Desea iniciar un juego? Y / N '
option = gets.chomp
# comparar la opción del usuario
if option.casecmp('Y').zero?
  p 'Por favor ingrese su nombre: '
  name = gets.chomp
  #   Archivo con las definciones
  file = 'C:\Users\arley\Documents\MakeItReal\CursoPresencial\retos\ruby\ProyectoReto5\definitions.txt'
  #   Objeto con el nuevo juego
  newGame = Game.new(name, file)
  p ''
  p "Hola #{newGame.user} tu puntaje actual es #{newGame.score}"
  #   Array para mostrar el numero de ronda
  round = { 0 => 'Primera', 1 => 'Segunda', 2 => 'Tercera', 3 => 'Cuarta', 4 => 'Quinta' }
  p ''
  #   Cargar definiciones
  array = newGame.load_definitions

  #   iteracion para 5 rondas
  5.times do |count|
    # metodo para limpiar la pantalla
    Gem.win_platform? ? (system 'cls') : (system 'clear')
    p "#{round[count]} Ronda" + ' ' * 30 + "Usuario: #{newGame.user.upcase} Puntaje: #{newGame.score}"
    # cargar definicion y repuesta
    hash = array[count]
    p ''
    # Mostrar pregunta
    p (hash[:definition]).to_s
    p 'Por favor escriba su respuesta: '
    res = gets.chomp

    # Validar si es correcta la opcion del usuario
    if res.casecmp(hash[:answer]).zero?
      puts 'CORRECTO !!'
      p ''
      # Aumentar el score
      newGame.ChangeScore
      p "Tu puntaje actual es #{newGame.score}"
      p ''
      p 'Pulse cualquier tecla para continuar'
      gets.chomp

    else
      puts 'INCORRECTO !!'
      p "La respuesta correcta es #{hash[:answer]}"
      p 'Pulse cualquier tecla para continuar'
      gets.chomp
    end
    # Limpiar pantalla y mostrar resultado final
    Gem.win_platform? ? (system 'cls') : (system 'clear')
    p '*' * 31
    p '*' * 5 + " Usuario: #{newGame.user} "
    p '*' * 5 + " Puntaje Final: #{newGame.score} "
    p '*' * 31
  end

end
