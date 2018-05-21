a = fn -> 1 + 2 end
pid = spawn fn -> 1 + 2 end
IO.puts(inspect(a))
IO.puts(inspect(pid))
