defmodule Slug.CLI do
  @moduledoc """
  Given a url (copied to the clipboard), determine the target format
  (roam or markdown link) and call the main program to process the
  url

  Example:
  $ ./slug -t roam
  $ ./slug --target roam
  $ ./slug --target link
  $ ./slug
  """

  def main(args) do
    options = [switches: [target: :string], aliases: [t: :target]]

    {opts, _, _} = OptionParser.parse(args, options)

    case opts do
      [target: "roam"] -> Slug.main(&Slug.format_roam/1)
      [target: "link"] -> Slug.main(&Slug.format_link/1)
      [] -> Slug.main(&Slug.format_link/1)
    end
  end
end
