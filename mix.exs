defmodule BuildpacksRegistryApi.MixProject do
  use Mix.Project

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(:dev), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  @source_url "https://github.com/flowerworkio/buildpacks_registry_api"
  @api_spec_url "https://github.com/buildpacks/registry-api"
  @buildpacks_registry_url "https://registry.buildpacks.io"
  @version "0.2.4"
  def version, do: @version

  def project do
    [
      app: :buildpacks_registry_api,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      description: """
      An API client for the buildpacks registry with caching.
      """,
      docs: [
        logo: "./assets/buildpacks.png",
        extras: ["README.md"]
      ],
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      homepage_url: @source_url,
      package: package(),
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      source_url: @source_url,
      start_permanent: Mix.env() == :prod,
      version: @version
    ]
  end

  def application do
    [
      extra_applications: [:logger, :inets],
      mod: {BuildpacksRegistryApi, [env: Mix.env()]}
    ]
  end

  defp package do
    [
      description: """
      An API client for the buildpacks registry with caching.
      """,
      maintainers: ["Patrick H Wiseman"],
      licenses: ["Apache-2.0"],
      links: %{
        "Source code" => @source_url,
        "API Spec" => @api_spec_url,
        "Buildpacks Registry" => @buildpacks_registry_url
      }
    ]
  end

  defp deps do
    [
      {:excoveralls, "~> 0.10", only: :test},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:castore, ">= 0.0.0"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.5", only: [:dev, :test]}
    ]
  end
end
