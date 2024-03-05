# Design Patterns: Singleton
# Example 1:

class Configuracion
  private_class_method :new
  attr_reader :valor

  # Crea la instancia unica de la clase
  def self.instance
    @instance ||= new
  end

  # Define metodos de acceso a la configuracion
  def obtener_valor
    # Implementa el acceso a la configuracion
    "Obteniendo el valor de la configuracion"
  end

  def establecer_valor(valor)
    # Implementa el acceso a la configuracion
  end

  # Constructor privado para evitar la creacion de nuevas instancias
  private
  def initialize
    # ... logica de inicializacion
  end

end

config = Configuracion.instance
puts config.obtener_valor
