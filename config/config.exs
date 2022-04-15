import Config

if Mix.env() == :test do
  config :logger, level: :warn
end

if Mix.env() == :test do
  Application.put_env(:buildpacks_registry_api, :endpoint, "http://localhost:9000/api/v1")
end
