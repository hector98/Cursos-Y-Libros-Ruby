# Design Patterns: Abstract Factory
# Example 1:

# Definir las interfaces para los productos muebles\
module Sofa
  attr_reader :name, :material
  def initialize(name, material)
    @name = name
    @material = material
  end

  def describe
    "Sofa #{@name} de #{@material}"
  end
end

module Mesa
  def initialize(name, material)
    @name = name
    @material = material
  end

  def describe
    "Mesa #{@name} de #{@material}"
  end
end

# Definir las class abstractas para la fabrica
class AbstractFurnitureFactory
  def create_sofa(name, material)
    puts "_#{self}"
    raise NotImplementedError, "#{self.class} no implementa el método 'create_sofa'"
  end

  def create_mesa(name, material)
    raise NotImplementedError, "#{self.class} no implementa el método 'create_mesa'"
  end
end

# Definir las fabricas concretas para cada marca
class ModernFurnitureFactory < AbstractFurnitureFactory
  def create_Sofa(name, material)
    ModernSofa.new(name, material)
  end

  def create_Mesa(name, material)
    ModernMesa.new(name, material)
  end
end

class ClassicFurnitureFactory < AbstractFurnitureFactory
  def create_Sofa(name, material)
    ClassicSofa.new(name, material)
  end

  def create_Mesa(name, material)
    ClassicMesa.new(name, material)
  end
end

# Define las clases concretas para los productos de cada marca
class ModernSofa
  include Sofa
end

class ModernMesa
  include Mesa
end

class ClassicSofa
  include Sofa
end

class ClassicMesa
  include Mesa
end

# Ejemplo de uso
# Elige la fabrica deseada
factory = ClassicFurnitureFactory.new

# Crea el sofa y la mesa con la fabrica elejida
sofa = factory.create_sofa("Sofa moderno", "Madera")
#mesa = factory.create_mesa("Mesa moderna", "Madera")

# Imprime la descripción de los productos
puts sofa.describe
#puts mesa.describe
