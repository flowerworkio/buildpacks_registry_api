# Buildpacks Registry API for Elixir

[![Build status](https://badge.buildkite.com/e2f3cfac457b7e836ca3a434c8e8a5ad22cecd84432270630a.svg)](https://buildkite.com/flowerwork/buildpacks-registry-api)
[![Coverage Status](https://coveralls.io/repos/github/flowerworkio/buildpacks_registry_api/badge.svg?branch=phw-add-docs)](https://coveralls.io/github/flowerworkio/buildpacks_registry_api?branch=phw-add-docs)

## Installation

[Available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `buildpacks_registry_api` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:buildpacks_registry_api, "~> 0.2.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/buildpacks_registry_api](https://hexdocs.pm/buildpacks_registry_api).

## Usage

The Buildpacks Registry API client can be used with or without caching. Caching is recommended.

`BuildpacksRegistryAPI.Client` defines the uncached client.
`BuildpacksRegistryApi.CacheClient` defines the cached client.
