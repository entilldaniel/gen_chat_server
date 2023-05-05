defmodule ServerChat.Application do

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {ServerChat.EntryServer, []},
      {Registry, keys: :unique, name: Registry.Users},
      {Chat.UserSupervisor, []},
      {Registry, keys: :unique, name: Registry.Rooms},
      {Chat.RoomSupervisor, []}
    ]

    opts = [strategy: :one_for_one, name: ServerChat.Supervisor]
    Supervisor.start_link(children, opts)
  end
  
end
