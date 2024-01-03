
def mulMat(a, b, c, m, n, p)
  for i in 0..m-1
    for j in 0..p-1
      c[i][j] = 0;
      for k in 0..n-1
        c[i][j] += a[i][k] * b[k][j];
      end
    end
  end
  return c
end

a = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
b = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
c = [[0, 0, 0], [0, 0, 0], [0, 0, 0]];

m = 3;
n = 3;
p = 3;

puts mulMat(a, b, c, m, n, p)
