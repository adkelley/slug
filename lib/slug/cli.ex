defmodule Slug.CLI do
  @moduledoc """
  Given a url (copied to the clipboard), determine the target format
  (roam or markdown link) and call the main program to process the
  url

  Example:
  $ ./slug -t unread
  $ ./slug --tags unread#food
  $ ./slug
  """

  def main(args) do
    options = [switches: [tags: :string], aliases: [t: :tags]]

    {opts, _, _} = OptionParser.parse(args, options)

    case opts do
      [tags: tags] ->
        Slug.main(List.first(args), tags)

      [] ->
        Slug.main(List.first(args))
    end
  end
end
