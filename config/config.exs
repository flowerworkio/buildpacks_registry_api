import Config

if Mix.env() == :test do
  config :logger, level: :warn
end

Application.put_env(BuildpacksRegistryApi, :endpoint, "https://registry.buildpacks.io/api/v1")
