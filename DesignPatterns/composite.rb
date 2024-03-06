# Design Patterns: Composite
# Structural
# Example 1:

# Componente base
class Componente
  def initialize(nombre)
    @nombre = nombre
  end

  def nombre
    @nombre
  end

  def agregar(componente)
    raise NotImplementedError, "#{self.class} no implementa el método 'agregar'"
  end

  def eliminar(componente)
    raise NotImplementedError, "#{self.class} no implementa el método 'eliminar'"
  end

  def imprimir
    raise NotImplementedError, "#{self.class} no implementa el método 'imprimir'"
  end
end

# Componente hoja
class ComponenteHoja < Componente
  def initialize(nombre)
    super nombre
  end

  def imprimir
    puts "Componente hoja: #{@nombre}"
  end
end

# Componente compuesto
class ComponenteCompuesto < Componente
  def initialize(nombre)
    super nombre
    @componentes = []
  end

  def agregar(componente)
    @componentes << componente
  end

  def eliminar(componente)
    @componentes.delete(componente)
  end

  def imprimir
    puts "Componente compuesto: #{@nombre}"
    @componentes.each do |componente|
      componente.imprimir
    end
  end
end

# Ejemplo de uso
componente_raiz = ComponenteCompuesto.new("Raiz")

componente_hoja1 = ComponenteHoja.new("Hoja 1")
componente_hoja2 = ComponenteHoja.new("Hoja 2")

componente_raiz.agregar(componente_hoja1)
componente_raiz.agregar(componente_hoja2)

componente_compuesto_2 = ComponenteCompuesto.new("Compuesto 2")
componente_hoja3 = ComponenteHoja.new("Hoja 3")
componente_compuesto_2.agregar(componente_hoja3)

componente_raiz.agregar(componente_compuesto_2)
componente_raiz.imprimir
