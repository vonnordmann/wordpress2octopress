WordPress-2-Octopress
=====================

This contains an XSLT 2 stylesheet to convert WordPress blog posts (exported XML format) into Octopress markdown files.

It's intended for sites with lots of blog posts, since the main value is generating rough versions of the blog post files themselves from the WordPress export. My blog has several dozen posts, and it was just too painful to have to copy/paste the posts from the WordPress dashboard to Octopress `rake new_post["..."]` files, so after about six posts I put this together.

Setup
-----

First, install Saxon or some other XSLT processor. On Mac with Homebrew you can do `brew install saxon`.

To get the WordPress XML file, go to Dashboard &rarr; Tools &rarr; Export. Then drop that file in the wordpress2octopress root directory.

You will need to modify the `build` script since I have it hardcoded to build my own blog's export file. Just change the XML filename to yours. Also, if you aren't using Saxon, then you'll need to modify the command accordingly.

Running
-------

Once you do the setup, run `.\build`. The script will generate a bunch of Octopress blog posts in the _posts directory. You can copy those to your Octopress `sources/_posts` directory.

Limitations
-----------

I wrote this as a quick and dirty script to migrate my personal blog. So it does 80% of the work, but not everything.

* It doesn't convert your WordPress HTML to Markdown. Fortunately Octopress can display HTML, but if you want Markdown, you'll need to handle that yourself.
* It doesn't currently handle tags or comments. I'm planning to do those shortly as I have lots of tags and comments I need to migrate (plan to migrate the comments to Discus), but not doing it yet.
* It doesn't copy your images to new locations.

Happy to take pull requests if you have improvements.
