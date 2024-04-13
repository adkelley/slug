defmodule Slug do
  @moduledoc """
  Given a url, extract the slug, capitalize the first word.
  and copy the slug and the url as a markdown link to the clipboard.
  Add tags when the -t or --tags operator is present
  """

  @spec url_to_slug(String.t(), integer()) :: String.t()
  defp url_to_slug(url, slot) do
    slots =
      url
      |> String.trim()
      |> String.trim_trailing("/")
      |> String.split(~r{https?://}, parts: 2)
      |> List.last()
      |> String.split("/")

    if slot == 0 do
      List.last(slots)
      |> format_slug()
    else
      Enum.at(slots, slot - 1, List.last(slots))
      |> format_slug()
    end
  end


  # Formats a slug by replacing hyphens with a space and capitalizing each word
  @spec format_slug(String.t()) :: String.t()
  defp format_slug(slug) do
      String.split(slug, "-")
      |> Enum.map(&String.capitalize/1)
      |> Enum.join(" ")
  end

  @spec url_slug(String.t(), String.t()) :: %{url: String.t(), slug: String.t()}
  defp url_slug(url, slot), do: %{url: url, slug: url |> url_to_slug(slot)}

  @spec format_link(map(), String.t()) :: String.t()
  defp format_link(%{url: url, slug: slug}, tags) do
    if tags == "" do
      "[#{slug}](#{url})"
    else
      "[#{slug}](#{url}) #{format_tags(tags)}"
    end
  end

  @spec format_tags(String.t()) :: String.t()
  defp format_tags(tags) do
    tags
    |> String.split("#")
    |> Enum.reduce("", fn tag, acc -> "#{acc} ##{tag}" end)
    |> String.trim_leading()
  end

  @spec main(String.t(), list()) :: :ok
  def main(url, tags, slot \\ 0) do
    url_slug(url, slot)
    |> format_link(tags)
    |> Clipboard.copy()

    # wait for the system to update the clipboard
    :timer.sleep(100)
  end
end
