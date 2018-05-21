defmodule Example do
  def double(x) do
    :timer.sleep(2000)
    x * 2
  end
end

task = Task.async(Example, :double, [2000])
IO.puts(Task.await(task))
