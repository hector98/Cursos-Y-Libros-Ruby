def hallarMax(e, n)
  max = e[0]
  for indice in 1..n-1
    if max < e[indice]
      max = e[indice]
    end
  end

  return max
end

e = [3, 5, 1, 2, 4]
n = 5
max = hallarMax(e, n)
puts max
