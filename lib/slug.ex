defmodule Slug do
  @moduledoc """
  Given a url, extract the slug, capitalize the first word.
  and copy the slug and the url as a markdown link to the clipboard.
  Add tags when the -t or --tags operator is present
  """

  @spec url_to_slug(String.t()) :: String.t()
  defp url_to_slug(value) do
    value
    |> String.trim()
    |> String.trim_trailing("/")
    |> String.split("/")
    # TODO This where I can select the slot
    |> List.last()
    |> String.replace("-", " ")

    # TODO Capitalizing the first letter should be an option?
    # |> String.capitalize()
  end

  @spec url_slug(String.t()) :: %{url: String.t(), slug: String.t()}
  def url_slug(url), do: %{url: url, slug: url |> url_to_slug()}

  @spec format_link(map(), String.t()) :: String.t()
  def format_link(%{url: url, slug: slug}, tags) do
    if tags == "" do
      "[#{slug}](#{url})"
    else
      "[#{slug}](#{url}) #{format_tags(tags)}"
    end
  end

  @spec format_tags(String.t()) :: String.t()
  def format_tags(tags) do
    tags
    |> String.split("#")
    |> Enum.reduce("", fn tag, acc -> "#{acc} ##{tag}" end)
    |> String.trim_leading()
  end

  @spec main(String.t(), list()) :: :ok
  def main(url, tags \\ "") do
    url_slug(url)
    |> format_link(tags)
    |> Clipboard.copy()

    # wait for the system to update the clipboard
    :timer.sleep(100)
  end
end
