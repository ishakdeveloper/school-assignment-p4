defmodule Api.MixProject do
  use Mix.Project

  def project do
    [
      app: :api,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Api.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.6.2"},
      {:plug_cowboy, "~> 2.5.0"},
      {:jason, "~> 1.2.2"},
      {:myxql, "~> 0.5.0"},
      {:cors_plug, "~> 2.0"}
    ]
  end
end
