defmodule BuildpacksRegistryApiTest do
  use ExUnit.Case
  doctest BuildpacksRegistryApi

  test "start_link" do
    Application.stop(:buildpacks_registry_api)
    assert {:ok, _} = BuildpacksRegistryApi.start("", env: :test)
  end
end
