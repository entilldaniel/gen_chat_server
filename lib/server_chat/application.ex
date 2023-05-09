defmodule ServerChat.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {GenChat, []},
      {ServerChat.EntryServer, []}
    ]

    opts = [strategy: :one_for_one, name: ServerChat.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
