#Funciones anónimas
sum = fn (a, b) -> a + b end
IO.puts(sum.(1, 5))

#Usandondo el operador de captura &.
sum = &(&1 + &2) 
IO.puts(sum.(3, 2))

#Funciones de coincidencia de patrones: 
handle_result = fn
   {var1} -> IO.puts("#{var1} found in a tuple!")
   {var_2, var_3} -> IO.puts("#{var_2} and #{var_3} found!")
end
handle_result.({"Hey people"})
handle_result.({"Hello", "World"})