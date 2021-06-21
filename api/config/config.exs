import Config

config :api, Plants.Repo,
  database: "api_repo",
  username: "root",
  password: "",
  hostname: "localhost"

config :api, ecto_repos: [Plants.Repo]
