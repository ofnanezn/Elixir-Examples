send self(), {:hello, "world"}

receive do
    {:hello, msg} -> msg
    {:world, msg} -> "Not matching"
end

