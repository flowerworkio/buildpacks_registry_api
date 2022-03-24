defmodule BuildpacksRegistryApi.CacheClient do
  @moduledoc """
  GenServer cached client implementation for the [Buildpacks Registry API](https://github.com/buildpacks/registry-api)

  Default timeout is one (1) hour.
  """

  @name :buildpacks_registry_api_cache_client

  use GenServer

  require Logger

  alias BuildpacksRegistryApi.Client

  defmodule State do
    @moduledoc false
    defstruct cache_timeout: :timer.hours(1), cache: %{}
  end

  # Client functions
  @spec start_link(any) :: :ignore | {:error, any} | {:ok, pid}
  def start_link(_arg) do
    Logger.info("Starting BuildpacksRegistryApi.CacheClient...")
    GenServer.start_link(__MODULE__, %State{}, name: @name)
  end

  @doc """
  Clears the cache.
  """
  @spec clear() :: :ok
  def clear() do
    GenServer.cast(@name, :clear)
  end

  @doc """
  Gets the config for the cache client.
  """
  @spec config() :: map()
  def config() do
    GenServer.call(@name, :config)
  end

  @doc """
  Sets the cache timeout in milliseconds.
  """
  @spec set_cache_timeout(integer) :: :ok
  def set_cache_timeout(timeout_in_ms) do
    GenServer.cast(@name, {:set_cache_timeout, timeout_in_ms})
  end

  @doc false
  def get(path, query_params) do
    GenServer.call(@name, {:return_cache_or_get, path, query_params})
  end

  @spec search(binary()) :: list(map())
  @doc """

  Searches the registry for a buildpacks that match a string term.

  ## Examples

  In the example below, we seach for ruby buildpacks and receive back a List of buildpack object maps:
      iex> BuildpacksRegistryApi.Client.search("ruby")
      [
        %{
          latest: %{
            addr:
              "public.ecr.aws/heroku-buildpacks/heroku-ruby-buildpack@sha256:3eeb3773cdbd29d4fb0d578f7781fe8c525de73593480e2740b7143262e5bef5",
            created_at: "2021-10-27T21:00:43.307Z",
            description: "",
            homepage: "",
            id: "f7c0dcc3-55ab-46b9-9a89-e35ff60aa7f8",
            licenses: nil,
            name: "ruby",
            namespace: "heroku",
            stacks: ["heroku-18", "heroku-20"],
            updated_at: "2022-03-17T20:28:16.367Z",
            version: "0.1.3",
            version_major: "0",
            version_minor: "1",
            version_patch: "3",
            yanked: false
          },
          versions: [
            %{
              _link: "https://registry.buildpacks.io/api/v1/buildpacks/heroku/ruby/0.1.3",
              version: "0.1.3"
            },
            %{
              _link: "https://registry.buildpacks.io/api/v1/buildpacks/heroku/ruby/0.1.2",
              version: "0.1.2"
            },
            %{
              _link: "https://registry.buildpacks.io/api/v1/buildpacks/heroku/ruby/0.1.1",
              version: "0.1.1"
            },
            %{
              _link: "https://registry.buildpacks.io/api/v1/buildpacks/heroku/ruby/0.1.0",
              version: "0.1.0"
            }
          ]
        },
        %{
          latest: %{
            addr:
              "index.docker.io/paketobuildpacks/ruby@sha256:19254ce071ad2139309280e0f88f19f7b44ff58e684c6ac834f48d1b87b946d5",
            created_at: "2022-02-04T14:43:47.833Z",
            description: "A language family buildpack for building Ruby apps",
            homepage: "https://github.com/paketo-buildpacks/ruby",
            id: "d357aacd-b201-4dee-8de3-913ecc3b02bf",
            licenses: ["Apache-2.0"],
            name: "ruby",
            namespace: "paketo-buildpacks",
            stacks: ["io.buildpacks.stacks.bionic"],
            updated_at: "2022-03-17T20:28:13.408Z",
            version: "0.11.0",
            version_major: "0",
            version_minor: "11",
            version_patch: "0",
            yanked: false
          },
          versions: [
            %{
              _link:
                "https://registry.buildpacks.io/api/v1/buildpacks/paketo-buildpacks/ruby/0.11.0",
              version: "0.11.0"
            },
            %{
              _link:
                "https://registry.buildpacks.io/api/v1/buildpacks/paketo-buildpacks/ruby/0.10.0",
              version: "0.10.0"
            },
            %{
              _link:
                "https://registry.buildpacks.io/api/v1/buildpacks/paketo-buildpacks/ruby/0.9.1",
              version: "0.9.1"
            },
            %{
              _link:
                "https://registry.buildpacks.io/api/v1/buildpacks/paketo-buildpacks/ruby/0.9.0",
              version: "0.9.0"
            },
            %{
              _link:
                "https://registry.buildpacks.io/api/v1/buildpacks/paketo-buildpacks/ruby/0.8.0",
              version: "0.8.0"
            },
            %{
              _link:
                "https://registry.buildpacks.io/api/v1/buildpacks/paketo-buildpacks/ruby/0.7.3",
              version: "0.7.3"
            },
            %{
              _link:
                "https://registry.buildpacks.io/api/v1/buildpacks/paketo-buildpacks/ruby/0.7.2",
              version: "0.7.2"
            },
            %{
              _link:
                "https://registry.buildpacks.io/api/v1/buildpacks/paketo-buildpacks/ruby/0.7.1",
              version: "0.7.1"
            },
            %{
              _link:
                "https://registry.buildpacks.io/api/v1/buildpacks/paketo-buildpacks/ruby/0.7.0",
              version: "0.7.0"
            },
            %{
              _link:
                "https://registry.buildpacks.io/api/v1/buildpacks/paketo-buildpacks/ruby/0.6.0",
              version: "0.6.0"
            },
            %{
              _link:
                "https://registry.buildpacks.io/api/v1/buildpacks/paketo-buildpacks/ruby/0.5.0",
              version: "0.5.0"
            },
            %{
              _link:
                "https://registry.buildpacks.io/api/v1/buildpacks/paketo-buildpacks/ruby/0.4.0",
              version: "0.4.0"
            }
          ]
        },
        %{
          latest: %{
            addr:
              "index.docker.io/paketobuildpacks/passenger@sha256:61fa1b7b6eaa0bdb24a8bc24b5d63ad17a41b4d6ac194daf1d9be04a5ceba58b",
            created_at: "2022-03-07T15:17:52.865Z",
            description: "A buildpack for starting a passenger server for a Ruby app",
            homepage: "https://github.com/paketo-buildpacks/passenger",
            id: "b15e5032-10a6-4da9-8ae8-87e9c0dcfc75",
            licenses: ["Apache-2.0"],
            name: "passenger",
            namespace: "paketo-buildpacks",
            stacks: ["io.buildpacks.stacks.bionic"],
            updated_at: "2022-03-17T20:28:13.149Z",
            version: "0.4.0",
            version_major: "0",
            version_minor: "4",
            version_patch: "0",
            yanked: false
          },
          versions: [
            %{
              _link:
                "https://registry.buildpacks.io/api/v1/buildpacks/paketo-buildpacks/passenger/0.4.0",
              version: "0.4.0"
            }
          ]
        }
      ]
  """
  def search(term) do
    get("/search", %{matches: term})
  end

  @doc """
  Get a list of buildpack versions for the namespaced buildpack. Returns a buildpack version map.

  ## Examples
      iex> BuildpacksRegistryApi.Client.buildpack_version_list("heroku", "ruby")
      %{
        latest: %{
          description: "",
          homepage: "",
          id: "f7c0dcc3-55ab-46b9-9a89-e35ff60aa7f8",
          licenses: nil,
          name: "ruby",
          namespace: "heroku",
          stacks: ["heroku-18", "heroku-20"],
          version: "0.1.3"
        },
        versions: [
          %{
            _link: "https://registry.buildpacks.io//api/v1/buildpacks/heroku/ruby/0.1.3",
            version: "0.1.3"
          },
          %{
            _link: "https://registry.buildpacks.io//api/v1/buildpacks/heroku/ruby/0.1.2",
            version: "0.1.2"
          },
          %{
            _link: "https://registry.buildpacks.io//api/v1/buildpacks/heroku/ruby/0.1.1",
            version: "0.1.1"
          },
          %{
            _link: "https://registry.buildpacks.io//api/v1/buildpacks/heroku/ruby/0.1.0",
            version: "0.1.0"
          }
        ]
      }
  """
  @spec buildpack_version_list(binary(), binary()) :: map()
  def buildpack_version_list(namespace, name) do
    get("/buildpacks/#{namespace}/#{name}", %{})
  end

  @doc """
  Returns detailed information for the buildpack version.any()

  ## Examples
      iex> BuildpacksRegistryApi.Client.buildpack_version_info("heroku", "ruby", "0.1.3")
      %{
        addr:
          "public.ecr.aws/heroku-buildpacks/heroku-ruby-buildpack@sha256:3eeb3773cdbd29d4fb0d578f7781fe8c525de73593480e2740b7143262e5bef5",
        created_at: "2021-10-27T21:00:43.307Z",
        description: "",
        homepage: "",
        id: "f7c0dcc3-55ab-46b9-9a89-e35ff60aa7f8",
        licenses: nil,
        name: "ruby",
        namespace: "heroku",
        stacks: ["heroku-18", "heroku-20"],
        updated_at: "2022-03-17T21:20:26.981Z",
        version: "0.1.3",
        version_major: "0",
        version_minor: "1",
        version_patch: "3",
        yanked: false
      }
  """
  @spec buildpack_version_info(binary(), binary(), binary()) :: map()
  def buildpack_version_info(namespace, name, version) do
    get("/buildpacks/#{namespace}/#{name}/#{version}", %{})
  end

  # Server callbacks
  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_cast(:clear, state) do
    Logger.debug("Clearing cache")
    {:noreply, %{state | cache: %{}}}
  end

  @impl true
  def handle_cast({:set_cache_timeout, timeout_in_ms}, state) do
    Logger.debug("Setting cache timeout to #{timeout_in_ms}")
    {:noreply, %{state | cache_timeout: timeout_in_ms}}
  end

  @impl true
  def handle_call(:config, _from, state) do
    {:reply,
     %{
       cache_timeout: state.cache_timeout
     }, state}
  end

  @impl true
  def handle_call({:return_cache_or_get, path, params}, _from, %State{} = state) do
    url = BuildpacksRegistryApi.Client.process_url(path, params)
    now = Time.utc_now()

    case state.cache |> Map.get(url) do
      nil ->
        Logger.debug("#{url} cache miss")
        fetch_and_cache(path, params, state)

      cache_entry ->
        cache_expires_at = Time.add(cache_entry.fetched_at, state.cache_timeout, :millisecond)

        case cache_expires_at > now do
          true ->
            Logger.debug("#{url} cache hit")
            response = cache_entry.response
            {:reply, response, state}

          false ->
            Logger.debug("#{url} cache expiration")
            fetch_and_cache(path, params, state)
        end
    end
  end

  defp fetch_and_cache(path, params, state) do
    response = Client.get(path, params) |> Jason.decode!(keys: :atoms)
    url = BuildpacksRegistryApi.Client.process_url(path, params)

    new_cache =
      Map.merge(state.cache, %{
        url => %{
          response: response,
          fetched_at: Time.utc_now()
        }
      })

    new_state = %State{state | cache: new_cache}

    {:reply, response, new_state}
  end
end
