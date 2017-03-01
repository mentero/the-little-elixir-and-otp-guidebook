defmodule PingPong do
  def start_the_machine_of_evil do
    ping_pid = spawn(Ping, :loop, [])
    pong_pid = spawn(Pong, :loop, [])

    send(pong_pid, {ping_pid, :ping})
  end
end

defmodule Ping do
  def loop do
    receive do
      {pid, :pong} ->
        IO.puts "Ping"
        send(pid, {self(), :ping})
      _ -> IO.puts "dunno"
    end
    loop()
  end
end

defmodule Pong do
  def loop do
    receive do
      {pid, :ping} ->
        IO.puts "Pong"
        send(pid, {self(), :pong})
      _ -> IO.puts "dunno"
    end
    loop()
  end
end
