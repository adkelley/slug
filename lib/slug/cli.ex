defmodule Slug.CLI do
  @moduledoc """
  Given a url (copied to the clipboard), capture the url and any options
  (tags and slot #) and call the main program to process the
  url

  Example:
  $ ./slug -t unread
  $ ./slug --tags unread#food
  $ ./slug --tags unread#food -s 2
  $ ./slug
  """

  def main(args) do
    options = [switches: [tags: :string, slot: :string], aliases: [t: :tags, s: :slot]]

    {opts, _, _} = OptionParser.parse(args, options)

    # Default to "" if tags not present
    tags = Keyword.get(opts, :tags, "")
    # Defaults to nil if slot not present
    slot = Keyword.get(opts, :slot)

    case slot do
      nil -> Slug.main(List.first(args), tags)
      _ -> Slug.main(List.first(args), tags, String.to_integer(slot))
    end
  end
end
