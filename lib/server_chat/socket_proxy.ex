defmodule ServerChat.SocketProxy do
  @behaviour GenChat.Comm.DataProxy

  require Logger

  def send(channel, message) do
    Logger.info(message)
    :gen_tcp.send(channel, "#{String.trim(message)}\n\n")
  end

  def receive(channel) do
    res = :gen_tcp.recv(channel, 0, 10_000)
    IO.inspect(res)
    res
  end
  
end
