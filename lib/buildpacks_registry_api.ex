defmodule BuildpacksRegistryApi do
  @moduledoc """
  Documentation for `BuildpacksRegistryApi`.
  """

  use Application

  def start(_type, _args) do
    IO.puts("Starting buildpacks registry API app...")
    BuildpacksRegistryApi.Supervisor.start_link()
  end
end
