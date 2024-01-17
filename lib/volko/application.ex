defmodule Volko.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      VolkoWeb.Telemetry,
      # Start the Ecto repository
      Volko.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Volko.PubSub},
      # Start Finch
      {Finch, name: Volko.Finch},
      # Start the Endpoint (http/https)
      VolkoWeb.Endpoint
      # Start a worker by calling: Volko.Worker.start_link(arg)
      # {Volko.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Volko.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    VolkoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
