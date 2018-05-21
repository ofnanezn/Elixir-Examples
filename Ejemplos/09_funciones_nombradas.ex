defmodule Math do
   def sum(a, b), do: a + b end
end
IO.puts(Math.sum(5, 6))


#Argumentos predeterminados
defmodule Greeter do
   def hello(name, country \\ "en") do
      phrase(country) <> name
   end

   defp phrase("en"), do: "Hello, "
   defp phrase("es"), do: "Hola, "
end

Greeter.hello("Ayush", "en")
Greeter.hello("Ayush")
Greeter.hello("Ayush", "es")
