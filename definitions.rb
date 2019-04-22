# modulo para cargar definiciones
module Definitions
  def load_definitions
#   valida si el archivo existe
    return [] unless File.file?(@file)

    # crear array de hashes
    definitions = []
#   iterar por las lineas del archivo
    File.foreach(file) do |line|
        # separar cada linea por el caracter , y guardarla en las variables definition y answer
      definition, answer = line.chomp.split(',')
    #   añadir el hash al array
      definitions.push(definition: definition, answer: answer)
    end
    # devolver el array mezclado aleatoreamente
    definitions.shuffle
  end
end
