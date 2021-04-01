defmodule Slug do

  @moduledoc """
  Given a url, extract the slug, capitalize the first word
  and copy it to the clipboard.
  """

  @spec main(String.t()) :: String.t()
  def main(_args) do
   %{url: url, slug: slug} = url_slug()
    "Read [#{slug}](#{url}) #[[Blog Posts]]" |> Clipboard.copy()
    :timer.sleep(100)
  end

  @spec url_slug()  :: %{url: String.t(), slug: String.t()}
  defp url_slug() do
    url = Clipboard.paste()
    slug = url |> get_slug()
    %{url: url, slug: slug}
  end


  @spec get_slug(String.t()) :: String.t()
  defp get_slug(value) do
    value
    |> String.trim_trailing("/")
    |> String.split("/")
    |> List.last()
    |> String.replace("-", " ")
    |> String.capitalize()
  end

end
