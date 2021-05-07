# Slug

Slug is an Elixir program that takes a slug (i.e., text from the tail end of a URL) from your clipboard
and turns it into a Markdown link. For example, `https://knowledgebase.com/what-is-a-wordpress-slug` becomes 
`[what is a wordpress slug](https://knowledgebase.com)`.

There's also an option to convert it to Markdown link that is formatted for my
writing in [Roam](https://roamresearch.com/). In this case `https://knowledgebase.com/what-is-a-wordpress-slug` becomes 
`Read [what is a wordpress slug](https://knowledgebase.com) #[[Blog Posts]] #unread`.
You can change the code to match your preferences (see below)


I use this script when I'm writing markdown and need to link to a blog post or some other reference. It's a 
real time saver compared to manually cutting, pasting and editing a slug. This script is best paired with 
script runner products such as [TextExpander](https://textexpander.com/) or [Alfred](https://www.alfredapp.com/)

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
```
# These options convert the slug to standard markdown
$ ./slug --target link
$ ./slug -t link
$ ./slug

# These options convert the slug for my use in Roam. Change it as you 
# wish by editing `./lib/slug/slug.ex` and `./lib/slug/cli.ex` 
$ ./slug --target roam
$ ./slug --t roam
```

## Sample shell scripts
When pairing this script together with Alfred, you can use the following shell script
```
#!/bin/bash
args="{query}"
/usr/local/bin/escript path/to/directory/slug $args
```
When pairing this script together with TextExpander, you can use the following shell script
```
#!/bin/bash
/usr/local/bin/escript path/to/directory/slug -t link
```




