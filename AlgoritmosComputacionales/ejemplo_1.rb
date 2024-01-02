class Fecha
  attr_accessor :year, :mes, :dia

  class Year
    attr_accessor :numero, :es_bisiesto
  end
end

fechas = []
fechas << Fecha.new

fechas[0].mes = 1
fechas[0].dia = 1
fechas[0].year = Fecha::Year.new
fechas[0].year.numero = 2000
fechas[0].year.es_bisiesto = true
