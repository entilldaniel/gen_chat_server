defmodule ServerChat.SocketProxy do
  @behaviour Chat.Comm.DataProxy

  require Logger

  def send(channel, message) do
    Logger.info(message)
    :gen_tcp.send(channel, "#{String.trim(message)}\n\n")
  end

  def receive(channel) do
    Logger.info("receiving")
    :gen_tcp.recv(channel, 0, 10_000)
  end
  
end
