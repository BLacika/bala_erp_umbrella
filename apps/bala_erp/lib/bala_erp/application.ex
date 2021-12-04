defmodule BalaErp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      BalaErp.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: BalaErp.PubSub}
      # Start a worker by calling: BalaErp.Worker.start_link(arg)
      # {BalaErp.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: BalaErp.Supervisor)
  end
end
