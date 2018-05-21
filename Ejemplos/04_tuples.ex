#Definir tuplas
tuple = {:ok, "hello"}

#Longitud de una tupla
IO.puts(tuple_size(tuple))

#Agregar un valor
tuple = Tuple.append(tuple, :world)
IO.puts(tuple_size(tuple))

#Insertar un  valor
tuple = Tuple.insert_at(tuple, 0, :foo)
tuple = put_elem(tuple, 1, :foobar)

#Acceder un elemento de la tupla
IO.puts(elem(tuple, 0))
