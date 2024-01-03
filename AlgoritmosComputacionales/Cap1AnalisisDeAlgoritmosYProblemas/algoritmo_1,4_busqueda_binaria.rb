def BusquedaBinaria(e, primero, ultimo, k)
  if ultimo < primero
    indice = -1
  else
    medio = (primero + ultimo)/2

    if k == e[medio]
      indice = medio
    elsif k < e[medio]
      indice = BusquedaBinaria(e, primero, medio-1, k)
    else
      indice = BusquedaBinaria(e, medio+1, ultimo, k)
    end
  end

    return indice
end

a1 = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 49, 51, 53, 55, 57, 59, 61, 63, 65, 67, 69, 71, 73, 75, 77, 79, 81, 83, 85, 87, 89, 91, 93, 95, 97, 99]
a2 = Range.new(10000, 1)

puts BusquedaBinaria(a1, 0, a1.length-1, 35) 
puts BusquedaBinaria(a1, 0, a1.length-1, 48)


