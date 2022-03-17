import Config

if Mix.env() == :test do
  config :logger, level: :warn
end

if Mix.env() == :test do
  Application.put_env(BuildpacksRegistryApi, :endpoint, "http://localhost:9000/api/v1")
else
  Application.put_env(BuildpacksRegistryApi, :endpoint, "https://registry.buildpacks.io/api/v1")
end
