# Buildpacks Registry API for Elixir

[![Build status](https://badge.buildkite.com/e2f3cfac457b7e836ca3a434c8e8a5ad22cecd84432270630a.svg)](https://buildkite.com/flowerwork/buildpacks-registry-api)
[![Coverage Status](https://coveralls.io/repos/github/flowerworkio/buildpacks_registry_api/badge.svg?branch=main)](https://coveralls.io/github/flowerworkio/buildpacks_registry_api)
[![Module Version](https://img.shields.io/hexpm/v/buildpacks_registry_api.svg)](https://hex.pm/packages/buildpacks_registry_api)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/buildpacks_registry_api/)
[![Total Download](https://img.shields.io/hexpm/dt/buildpacks_registry_api.svg)](https://hex.pm/packages/buildpacks_registry_api)
[![License](https://img.shields.io/hexpm/l/buildpacks_registry_api.svg)](https://github.com/flowerworkio/buildpack_registry_api/blob/master/LICENSE)
[![Last Updated](https://img.shields.io/github/last-commit/flowerworkio/buildpacks_registry_api.svg)](https://github.com/flowerworkio/buildpacks_registry_api/commits/master)

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
