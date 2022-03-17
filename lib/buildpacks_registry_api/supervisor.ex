defmodule BuildpacksRegistryApi.Supervisor do
  use Supervisor

  def start_link do
    IO.puts("Starting buildpacks registry API supervisor...")
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    children = [
      BuildpacksRegistryApi.CacheServer
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
