defmodule BuildpacksRegistryApi.CacheServer do
  @moduledoc """
  GenServer implementation for a Buildpacks Registry API cache.
  Ref: https://github.com/buildpacks/registry-api
  """
  use GenServer

  # Client functions
  @spec start_link(any) :: :ignore | {:error, any} | {:ok, pid}
  def start_link(default) do
    GenServer.start_link(__MODULE__, default)
  end

  # Server callbacks
  @impl true
  def init(stack) do
    {:ok, stack}
  end
end
