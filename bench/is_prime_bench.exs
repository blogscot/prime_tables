defmodule IsPrimeBench do
  use Benchfella

  bench "is small number prime" do
    PrimeTables.is_prime?(101)
  end

  bench "is big number prime" do
    PrimeTables.is_prime?(100000001)
  end

end

# λ mix bench
# Settings:
# duration:      1.0 s

# ## IsPrimeBench
# [13:40:43] 1/2: is big number prime
# [13:40:45] 2/2: is small number prime

# Finished in 4.74 seconds

# ## IsPrimeBench
# benchmark name         iterations   average time
# is small number prime     1000000   2.44 µs/op
# is big number prime          1000   1813.00 µs/op
