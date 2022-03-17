defmodule BuildpacksRegistryApiTest do
  use ExUnit.Case
  doctest BuildpacksRegistryApi

  test "greets the world" do
    assert BuildpacksRegistryApi.hello() == :world
  end
end
