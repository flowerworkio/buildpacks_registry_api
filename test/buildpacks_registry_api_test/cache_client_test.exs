defmodule BuildpacksRegistryApi.CacheClientTest do
  alias BuildpacksRegistryApi.CacheClient
  use ExUnit.Case, async: true
  doctest BuildpacksRegistryApi.CacheClient

  defp get_state do
    :sys.get_state(GenServer.whereis(:buildpacks_registry_api_cache_client))
  end

  test "#clear empties the cache" do
    assert %{status: "OK"} = CacheClient.get!("/healthz", %{})
    state = get_state()
    assert Enum.count(state.cache) != 0
    CacheClient.clear()
    state = get_state()
    assert Enum.count(state.cache) == 0
  end

  test "#config returns the config" do
    assert CacheClient.config() == %{cache_timeout: :timer.hours(1)}
  end

  test "#set_cache_timeout" do
    CacheClient.set_cache_timeout(1)
    assert CacheClient.config() == %{cache_timeout: 1}
    CacheClient.set_cache_timeout(:timer.hours(1))
  end

  test "GET /search returns a list of buildpacks" do
    response = CacheClient.search("ruby")
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
    response = CacheClient.buildpack_version_list("heroku", "ruby")

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
    response = CacheClient.buildpack_version_info("heroku", "ruby", "0.1.3")

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

  describe "#get" do
    test "with no cache it returns the API call response and adds it to cache" do
      now = Time.utc_now()

      assert {:reply, %{status: "OK"} = response, %CacheClient.State{} = state} =
               CacheClient.handle_call(
                 {:return_cache_or_get, "/healthz", %{}},
                 "",
                 %CacheClient.State{}
               )

      assert state.cache |> Map.keys() == ["http://localhost:9000/api/v1/healthz?"]
      cache_entry = state.cache["http://localhost:9000/api/v1/healthz?"]

      assert cache_entry |> Map.keys() == [
               :fetched_at,
               :response
             ]

      assert cache_entry.response == response
      assert Time.diff(cache_entry.fetched_at, now) < 3
    end

    test "with cache it returns the API call response from cache" do
      assert %{status: "OK"} = CacheClient.get!("/healthz", %{})
      state1 = get_state()

      assert %{status: "OK"} = CacheClient.get!("/healthz", %{})
      state2 = get_state()

      %{cache_timeout: cache_timeout} = CacheClient.config()
      assert cache_timeout == :timer.hours(1)
      assert state1 == state2
    end

    test "After cache expiration it returns the API call and adds it to cache" do
      CacheClient.set_cache_timeout(1)

      assert %{status: "OK"} = CacheClient.get!("/healthz", %{})
      state1 = get_state()
      :timer.sleep(1)
      assert %{status: "OK"} = CacheClient.get!("/healthz", %{})
      state2 = get_state()

      %{cache_timeout: cache_timeout} = CacheClient.config()
      assert cache_timeout == 1
      CacheClient.set_cache_timeout(:timer.hours(1))
      assert state1 != state2
    end
  end
end
