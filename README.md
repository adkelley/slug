# Slug

Slug is an Elixir program that takes a slug (i.e., text from the tail end of a URL) from your clipboard
and turns it into a Markdown link. For example, `https://knowledgebase.com/what-is-a-wordpress-slug` becomes 
`[what is a wordpress slug](https://knowledgebase.com)`.

There's also a flag to add tags to the end of the Markdown link. In this case 
```bash
$ slug https://knowledgebase.com/what-is-a-wordpress-slug -tags #unread 
```
becomes  `Read [what is a wordpress slug](https://knowledgebase.com) #unread`. You can change the code to match your preferences (see below)


I use this script when I'm writing markdown and need to link to a blog post or some other reference. It's a 
real time saver compared to manually cutting, pasting and editing a slug. This script is best paired with 
script runner products such as [TextExpander](https://textexpander.com/) or [Alfred](https://www.alfredapp.com/) on MacOS.

## Building
Use mix to build the script
```
$ mix escript.build
```

Running the script is as simple as follows:
1. Copy a URL that has a slug to the clipboard. For example, `https://knowledgebase.com/what-is-a-wordpress-slug` 
2. `$ ./slug`
3. The markdown link is copied to the clipboard `[what is a wordpress slug](https://knowledgebase.com)` 

## Options
```bash
# These options convert the slug to standard markdown
$ ./slug --tags #tag1#tag2 # Separate tags with a # as desired
$ ./slug -t #tag1#tag2     # Separate tags with a # as desired
$ ./slug
```

## Static code analysis
Similar to linting in other languages, I'm using [Credo](https://github.com/rrrene/credo) for help with refactoring opportunites, 
mistake warnings, and consistancy checks.  If you change the code, then you run Credo by running `mix credo` in the command line.
Credo also has integrations with editors such as VSCode, and Emacs.

## Sample shell scripts
When pairing this script together with Alfred or TextExpander, you can use the following shell script
```
#!/bin/bash
args="{query}"
/path/to/escript path/to/slug $args
```
## Slug compilation Todo

==> slug
Compiling 2 files (.ex)
warning: Clipboard.copy/1 defined in application :clipboard is used by the current application but the current application does not depend on :clipboard. To fix this, you must do one of:

  1. If :clipboard is part of Erlang/Elixir, you must include it under :extra_applications inside "def application" in your mix.exs

  2. If :clipboard is a dependency, make sure it is listed under "def deps" in your mix.exs

  3. In case you don't want to add a requirement to :clipboard, you may optionally skip this warning by adding [xref: [exclude: [Clipboard]]] to your "def project" in mix.exs

  lib/slug.ex:33: Slug.main/1

warning: Clipboard.paste/0 defined in application :clipboard is used by the current application but the current application does not depend on :clipboard. To fix this, you must do one of:

  1. If :clipboard is part of Erlang/Elixir, you must include it under :extra_applications inside "def application" in your mix.exs

  2. If :clipboard is a dependency, make sure it is listed under "def deps" in your mix.exs

  3. In case you don't want to add a requirement to :clipboard, you may optionally skip this warning by adding [xref: [exclude: [Clipboard]]] to your "def project" in mix.exs

  lib/slug.ex:30: Slug.main/1

## Chores
[ ] Be able to specify tags `$ slug -t `
