import Config

config :api, Plants.Repo,
  database: "planten",
  username: "root",
  password: "",
  hostname: "localhost"

config :api, ecto_repos: [Plants.Repo]
