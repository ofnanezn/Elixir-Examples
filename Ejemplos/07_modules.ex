#Agrupamos una o varias funciones en módulos.
defmodule Math do
   def sum(a, b) do
      a + b
   end
end
IO.puts(Math.sum(1, 2))