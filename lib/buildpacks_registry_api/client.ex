defmodule BuildpacksRegistryApi.Client do
  @moduledoc """
  HTTP Client implementation for Buildpacks Registry API
  Ref: https://github.com/buildpacks/registry-api
  """
  use HTTPoison.Base

  # HTTPoison Config
  def config do
    Application.get_all_env(BuildpacksRegistryApi)
  end

  defp endpoint, do: config()[:endpoint]

  @impl true
  def process_url(url) do
    endpoint() <> url
  end

  @impl true
  def process_request_options(options) do
    hackney = Keyword.get(options, :hackney, [])
    Keyword.put(options, :hackney, hackney)
  end

  @impl true
  def process_request_headers(headers) do
    headers ++
      [
        {"Accept", "application/json"}
      ]
  end

  @impl true
  def process_response_body(body) do
    case Jason.decode(body, keys: :atoms) do
      {:ok, json} -> json
      _ -> nil
    end
  end

  def search(term) do
    params = %{matches: term}

    {:ok, %HTTPoison.Response{body: body, status_code: 200}} =
      __MODULE__.get("/search", [], params: params)

    body
  end

  def buildpack_version_list(namespace, name) do
    {:ok, %HTTPoison.Response{body: body, status_code: 200}} =
      __MODULE__.get("/buildpacks/#{namespace}/#{name}")

    body
  end

  def buildpack_version_details(namespace, name, version) do
    {:ok, %HTTPoison.Response{body: body, status_code: 200}} =
      __MODULE__.get("/buildpacks/#{namespace}/#{name}/#{version}")

    body
  end
end
