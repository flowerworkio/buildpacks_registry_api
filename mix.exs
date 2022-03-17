defmodule BuildpacksRegistryApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :buildpacks_registry_api,
      description: """
      An API client for the buildpacks registry with caching.
      """,
      deps: deps(),
      elixir: "~> 1.13",
      homepage_url: "https://github.com/flowerworkio/buildpacks_registry_api",
      source_url: "https://github.com/flowerworkio/buildpacks_registry_api",
      start_permanent: Mix.env() == :prod,
      version: "0.1.0"
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {BuildpacksRegistryApi, []}
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:jason, "~> 1.0"}
    ]
  end
end
