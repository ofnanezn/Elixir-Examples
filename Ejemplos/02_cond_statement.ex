guess = 46
cond do
   guess == 10 -> IO.puts "You guessed 10!"
   guess == 46 -> IO.puts "You guessed 46!"
   guess == 42 -> IO.puts "You guessed 42!"
   true        -> IO.puts "I give up."
end