# Design Patterns: Decorator
# Example 1:
class Persona
  attr_reader :nombre
  
  def initialize(nombre)
    @nombre = nombre
  end

  def saludar
    "Hola, soy #{nombre}"
  end
end

# Decorador para agregar un saludo formal
class SaludoFormalDecorator
  def initialize(persona)
    @persona = persona
  end

  def saludar
    "#{@persona.saludar}, encantado de conocerte"
  end
end

# Decorador para agregar un saludo informal
class SaludoInformalDecorator
  def initialize(persona)
    @persona = persona
  end

  def saludar
    "#{@persona.saludar}, que onda?"
  end
end

# Ejemplo de uso
persona = Persona.new("Hector")
puts persona.saludar

# Decorar la persona con un saludo formal
persona_formal = SaludoFormalDecorator.new(persona)
puts persona_formal.saludar

# Decorar la persona con un saludo informal
persona_informal = SaludoInformalDecorator.new(persona)
puts persona_informal.saludar

