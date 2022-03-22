defmodule BuildpacksRegistryApi.ClientTest do
  alias BuildpacksRegistryApi.Client
  use ExUnit.Case
  doctest BuildpacksRegistryApi.Client

  test "Reads default config from BuildpacksRegistryApi app" do
    assert Client.config() == [endpoint: "http://localhost:9000/api/v1"]
  end

  test "GET /search returns a list of buildpacks" do
    response = Client.search("ruby")
    assert response |> Enum.count() == 3

    entry = response |> List.first()
    assert entry |> Map.keys() == [:latest, :versions]

    assert entry |> Map.get(:latest) |> Map.keys() == [
             :addr,
             :created_at,
             :description,
             :homepage,
             :id,
             :licenses,
             :name,
             :namespace,
             :stacks,
             :updated_at,
             :version,
             :version_major,
             :version_minor,
             :version_patch,
             :yanked
           ]

    assert entry |> Map.get(:versions) |> List.first() |> Map.keys() == [
             :_link,
             :version
           ]
  end

  test "GET /buildpacks/:namespace/:name returns a list of buildpack versions" do
    response = Client.buildpack_version_list("heroku", "ruby")

    assert response |> Map.keys() == [:latest, :versions]

    assert response.latest |> Map.keys() == [
             :description,
             :homepage,
             :id,
             :licenses,
             :name,
             :namespace,
             :stacks,
             :version
           ]

    assert response.versions |> List.first() |> Map.keys() == [:_link, :version]
  end

  test "GET /buildpacks/:namespace/:name/:version" do
    response = Client.buildpack_version_info("heroku", "ruby", "0.1.3")

    assert response |> Map.keys() == [
             :addr,
             :created_at,
             :description,
             :homepage,
             :id,
             :licenses,
             :name,
             :namespace,
             :stacks,
             :updated_at,
             :version,
             :version_major,
             :version_minor,
             :version_patch,
             :yanked
           ]
  end
end
