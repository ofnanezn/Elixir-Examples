#La forma más fácil de crear un nuevo proceso es usar la función spawn
pid = spawn(fn -> 2 * 2 end)
IO.puts( Process.alive?(pid) )

pid = self()
IO.puts( Process.alive?(pid) )

#paso de mensajes
send(self(), {:hello, "Hi people"})
receive do
   {:hello, msg} -> IO.puts(msg)
after
   1_000 -> "nothing after 1s"
end
