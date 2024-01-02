class Fecha
  attr_accessor :year, :mes, :dia

  class Year
    attr_accessor :numero, :es_bisiesto

    def self.copy(a)
      a2 = Year.new
      a2.numero = a.numero
      a2.es_bisiesto = a.es_bisiesto
      return a2
    end
  end

  def self.copy(f)
    f2 = Fecha.new
    f2.year = Year.copy(f.year) # Clase Organizadora
    f2.mes = f.mes
    f2.dia = f.dia
    return f2
  end

  def siglo_por_omision
  end

end
