defmodule Slug do
  @moduledoc """
  Given a url, extract the slug, capitalize the first word.
  and copy the slug and the url as a markdown link to the clipboard.
  If the target app is `Roam` then format the url and slug
  before copying it to the clipboard
  """

  @spec get_slug(String.t()) :: String.t()
  defp get_slug(value) do
    value
    |> String.trim_trailing("/")
    |> String.split("/")
    |> List.last()
    |> String.replace("-", " ")
    |> String.capitalize()
  end

  @spec url_slug(String.t()) :: %{url: String.t(), slug: String.t()}
  def url_slug(url), do: %{url: url, slug: url |> get_slug()}

  @spec format_roam(%{url: String.t(), slug: String.t()}) :: String.t()
  def format_roam(%{url: url, slug: slug}), do: "Read [#{slug}](#{url}) #[[Blog Posts]] #unread"

  @spec format_link(%{url: String.t(), slug: String.t()}) :: String.t()
  def format_link(%{url: url, slug: slug}), do: "[#{slug}](#{url})"

  @spec main(function()) :: :atom
  def main(format_fn) do
    Clipboard.paste()
    |> url_slug()
    |> format_fn.()
    |> Clipboard.copy()

    # wait for the system to update the clipboard
    :timer.sleep(100)
  end
end
