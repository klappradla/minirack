# Minirack

My micro version of [Rack](https://github.com/rack/rack), a minimal webserver interface in ruby for simple wrapping of http requests and responses. A tiny project to understand the basics of what Rack actually does.<br>
The idea was inspired by [this blog post](http://www.kavinder.com/blog/2014-10-10-rebuild-a-gem-rack/).

Minirack uses [Thin server](https://github.com/macournoyer/thin/):<br>
`gem install thin`

Minirack is executed via the `minirackup` command:<br>
`./bin/minirackup test.mru` calls the Hello-World test file, running a Proc object with 3 elements:
* numerical status
* header as hash
* content as string

