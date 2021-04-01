defmodule Slug.MixProject do
  use Mix.Project

  def project do
    [
      app: :slug,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      escript: escript(),
      deps: deps()
    ]
  end

  defp escript do
    [main_module: Slug, only: [:prod]]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:clipboard, ">= 0.0.0"}
    ]
  end
end
