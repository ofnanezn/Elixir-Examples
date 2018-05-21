
defmodule Walker do
  use GenServer

  def init(name) do
    :rand.seed(:exs1024)
    {:ok, name}
  end

  def handle_call(:get_ready, _from, name) do
    IO.puts "#{name} is getting ready..."
    time_to_get_ready = 6.0 + (:rand.uniform * 3.0)
    :timer.sleep( trunc(time_to_get_ready * 1000.0) )
    IO.puts "#{name} spent #{time_to_get_ready}sec getting ready"
    {:reply, :ok, name}
  end

  def handle_call(:tie_shoes, _from, name) do
    IO.puts "#{name} started putting on shoes"
    time_to_put_on_shoes = 3.5 + (:rand.uniform * 1.0)
    :timer.sleep( trunc(time_to_put_on_shoes * 1000.0) )
    IO.puts "#{name} spent #{time_to_put_on_shoes}sec putting on shoes"
    {:reply, :ok, name}
  end

  def get_ready(pid), do: GenServer.call(pid, :get_ready, 9_000)
  def tie_shoes(pid), do: GenServer.call(pid, :tie_shoes, 4_500)
end

{:ok, bob_pid} = GenServer.start_link(Walker, "bob")
{:ok, alice_pid} = GenServer.start_link(Walker, "alice")
IO.puts "Let's go for a walk!"

bob_get_ready = Task.async fn -> Walker.get_ready(bob_pid) end
alice_get_ready = Task.async fn -> Walker.get_ready(alice_pid) end
:ok = Task.await(bob_get_ready, 9_000)
:ok = Task.await(alice_get_ready, 9_000)
IO.puts "everyone is ready"

alarm_set = Task.async fn ->
  :timer.sleep( 6_000 )
  IO.puts "alarm armed!"
end

bob_tie_shoes = Task.async fn -> Walker.tie_shoes(bob_pid) end
alice_tie_shoes = Task.async fn -> Walker.tie_shoes(alice_pid) end
:ok = Task.await(bob_tie_shoes, 4_500)
:ok = Task.await(alice_tie_shoes, 4_500)

:ok = Task.await(alarm_set, 6_000)

