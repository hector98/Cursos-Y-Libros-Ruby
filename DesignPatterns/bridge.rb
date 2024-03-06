# Design Patterns: Bridge
# Example 1:

# Interfaz para la abstraccion
module Forma
  def dibujar
    raise NotImplementedError, "#{self.class} no implementa el método 'dibujar'"
  end
end

# Implementacion base del color
class ColorBase
  def initialize(color)
    @color = color
  end

  def to_s
    @color
  end
end

# Implementacion concreta del color
class ColorRojo < ColorBase
  def initialize(color = "Rojo")
    super color
  end

  def to_s
    @color
  end
end

# Implementacion concreta del color verde
class ColorVerde < ColorBase
  def initialize(color = "Verde")
    super color
  end

  def to_s
    @color
  end
end

# Clase base para las formas concretas
class FormaGeometrica
  def initialize(color)
    @color = color
  end

  def set_color(color)
    @color = color
  end
end

# Forma concreta: circulo
class Circulo < FormaGeometrica
  include Forma

  def dibujar
    puts "Dibujando un circulo de color #{@color}"
  end
end

# Forma concreta: cuadrado
class Cuadrado < FormaGeometrica
  include Forma

  def dibujar
    puts "Dibujando un cuadrado de color #{@color.to_s}"
  end
end

# Ejemplo de uso
circulo_rojo = Circulo.new(ColorRojo.new)
circulo_rojo.dibujar
circulo_verde = Circulo.new(ColorVerde.new)
circulo_verde.dibujar
circulo_verde.set_color(ColorRojo.new)
circulo_verde.dibujar
