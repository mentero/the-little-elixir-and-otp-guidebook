defmodule Cache do
  use GenServer

  @name PersonalCache

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts ++ [name: PersonalCache])
  end

  def write(key, value) do
    GenServer.cast(@name, {:write, key, value})
  end

  def read(key) do
    GenServer.call(@name, {:read, key})
  end

  def delete(key) do
    GenServer.cast(@name, {:delete, key})
  end

  def clear do
    GenServer.cast(@name, :clear)
  end

  def exists?(key) do
    GenServer.call(@name, {:exists?, key})
  end

  def inspect do
    GenServer.call(@name, :inspect)
  end

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_call({:read, key}, _from, cache) do
    value = Map.get(cache, key)
    {:reply, value, cache} 
  end

  def handle_call({:exists?, key}, _from, cache) do
    exists = Map.has_key?(cache, key)
    {:reply, exists, cache}
  end

  def handle_call(:inspect, _from, cache) do
    {:reply, cache, cache}
  end

  def handle_cast({:write, key, value}, cache) do
    cache = Map.put(cache, key, value)
    {:noreply, cache}
  end

  def handle_cast({:delete, key}, cache) do
    cache = Map.delete(cache, key)
    {:noreply, cache}
  end

  def handle_cast(:clear, _cache) do
    {:noreply, %{}}
  end
end
