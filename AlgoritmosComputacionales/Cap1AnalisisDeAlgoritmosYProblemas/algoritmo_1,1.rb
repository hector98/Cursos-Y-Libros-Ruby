def BusquedaSec(e, n, k)
  respuesta = -1 #Suponer el fracaso 
  indice = 0

  while indice < n
    if k == e[indice]
      respuesta = indice #!Exito
      break # Tomarse el resto de la tarde libre.
    end
    indice += 1
    # Continuar el ciclo.
  end
  return respuesta
end

e = [1,2,3,4,5,6]
puts BusquedaSec(e,6,4)
puts BusquedaSec(e,6,9)
puts BusquedaSec(e,6,2)
