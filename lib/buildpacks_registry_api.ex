defmodule BuildpacksRegistryApi do
  @moduledoc """
    Documentation for `BuildpacksRegistryApi`.
  """

  use Application

  def start(_type, args \\ []) do
    children = [
      BuildpacksRegistryApi.CacheClient
    ]

    mock_server_children = [
      {Plug.Cowboy, scheme: :http, plug: BuildpacksRegistryApi.MockServer, options: [port: 9000]}
    ]

    children =
      case args[:env] do
        :test ->
          children ++ mock_server_children

        _ ->
          children
      end

    opts = [strategy: :one_for_one, name: BuildpacksRegistryApi.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
