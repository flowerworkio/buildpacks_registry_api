defmodule BuildpacksRegistryApi.MockServer do
  @moduledoc false
  use Plug.Router

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["*/*"],
    json_decoder: Jason
  )

  plug(:match)
  plug(:dispatch)

  get "/api/v1/search" do
    success(conn, [
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
    ])
  end

  get "/api/v1/buildpacks/heroku/ruby" do
    success(conn, %{
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
    })
  end

  get "/api/v1/buildpacks/heroku/ruby/0.1.3" do
    success(conn, %{
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
    })
  end

  get "/api/v1/healthz" do
    success(conn, %{status: "OK"})
  end

  get "/*_rest" do
    failure(conn)
  end

  defp success(conn, body) do
    conn
    |> Plug.Conn.send_resp(200, Jason.encode!(body))
  end

  defp failure(conn) do
    conn
    |> Plug.Conn.send_resp(500, Jason.encode!(%{message: "an error message"}))
  end
end
