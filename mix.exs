defmodule Glare.MixProject do
  use Mix.Project

  def project do
    [
      app: :glare,
      version: "1.0.1",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Glare.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.4.0"},
      {:phoenix_pubsub, "~> 1.1"},
      {:phoenix_html, "~> 3.0"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.1"},
      {:plug_cowboy, "~> 2.0"},
      {:basic_auth, "~> 2.2.2"},
      {:credo, "~> 1.6.1", only: [:dev, :test], runtime: false},
      {:distillery, "~> 2.0"}
    ]
  end

  defp aliases do
    [
      "check-formatted": ["format --check-formatted"],
      "reason:format": ["cmd cd assets && npm run-script re:format"],
      "reason:build": ["cmd cd assets && npm run-script build"]
    ]
  end
end
