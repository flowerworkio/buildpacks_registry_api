defmodule BuildpacksRegistryApi.MixProject do
  use Mix.Project

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(:dev), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  @source_url "https://github.com/flowerworkio/buildpacks_registry_api"
  @api_spec_url "https://github.com/buildpacks/registry-api"
  @version "0.1.0"
  def version, do: @version

  def project do
    [
      app: :buildpacks_registry_api,
      deps: deps(),
      description: """
      An API client for the buildpacks registry with caching.
      """,
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      homepage_url: @source_url,
      licenses: ["Apache-2.0"],
      links: %{
        "Source code" => @source_url,
        "API Spec" => @api_spec_url,
        "Buildpacks Registry" => "https://registry.buildpacks.io"
      },
      organization: "flowerworkio",
      source_url: @source_url,
      start_permanent: Mix.env() == :prod,
      version: "0.1.0"
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {BuildpacksRegistryApi, [env: Mix.env()]}
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.5", only: [:dev, :test]}
    ]
  end
end
