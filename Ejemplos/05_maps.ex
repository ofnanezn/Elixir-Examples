#Crear un mapa: Un mapa es creado usando la sintaxis %{} . Los mapas permiten cualquier valor como clave.
map = %{:a => 1, 2 => :b}

#Acceder una llave
IO.puts(map[:a])
IO.puts(map[2])

#Insertar una llave
map = Map.put_new(map, :new_val, "value") 
IO.puts(map[:new_val])

#Actualizar un valor
map = %{ map | a: 25}
IO.puts(map[:a])

#La coincidencia de patrones
%{:a => a} = %{:a => 1, 2 => :b}
IO.puts(a)

#Mapas con llave tipo Atom: Cuando todas las claves en un mapa son de tipo atom, puede usar la sintaxis siguiente sintaxis
map_dos = %{:a => "Hola", :c => :b} 
IO.puts(map_dos.a)