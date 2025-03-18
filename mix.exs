defmodule Excrc32c.MixProject do
  use Mix.Project

  @version "0.1.0"
  @url "https://github.com/c2bw/excrc32c"

  def project do
    [
      app: :excrc32c,
      version: @version,
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: "Pure Elixir implementation of CRC32C"
    ]
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
      {:ex_doc, "~> 0.37.3", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      name: "excrc32c",
      source_url: @url,
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      licenses: ["MIT"],
      links: %{"GitHub" => @url}
    ]
  end
end
