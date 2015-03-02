# Minirack

My micro version of [Rack](https://github.com/rack/rack), a minimal interface between ruby webservers and frameworks for simple wrapping of http requests and responses. A tiny project to understand the basics of what Rack does.

The idea was inspired by [this blog post](http://www.kavinder.com/blog/2014-10-10-rebuild-a-gem-rack/).


## Getting Started

Minirack uses [Thin server](https://github.com/macournoyer/thin/) as its web server. To install the latest version, run:
```ruby
gem install thin
```

I implemented Minirack using Ruby 2.1 and Thin Server version 1.6.3.


## Usage

`minirackup` starts the webserver with the given application. If no arguments are given, minirack executs the default application file `config_default.mru`.

A config file contains a Proc with 3 items:
* numerical HTTP status code (200, 400...)
* hash of headers
* body of the responste as string

## Content

minirack consists of 3 parts:
* server
* app_builder
* app

After the server is initialized and started via the `minrackup` command, the app_builder parses the given application file (or the default application) and initializes an app. The app object is then returned and run by the application call.

Visit `localhost:9292` to view the application.