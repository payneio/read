# read.payne.io blog

This is my current blog setup. I've added it to github to share to anyone else that may be looking for an 
easy-to-manage yet quite customizable staticly generated blog.

# Thanks

I use [middleman](http://middlemanapp.com) for static site generation in Ruby. Thanks to [biblichor](https://github.com/biblichor/middleman-blog-bootstrap-template) for the starter middleman template. Biblichor forked from [headcanon's middleman-bower-template](https://github.com/headcanon/middleman-bower-template) originally. 

Also:

* Rendering engine
 - [Markdown](http://daringfireball.net/projects/markdown/) in posts
 - [Slim](http://slim-lang.com/) in layout
* Middleman plugins
 - [middleman-blog](http://github.com/middleman/middleman-blog/)
 - [middleman-livereload](http://github.com/middleman/middleman-livereload)
 - [middleman-target](http://github.com/xunker/middleman-target) 
 - [middleman-deploy](http://github.com/tvaughan/middleman-deploy) config snippet to ease FTP/SFTP deployment
* [Bower](http://github.com/twitter/bower) package management
 - [Normalize.css](http://necolas.github.com/normalize.css) 
 - [Modernizr](http://modernizr.com)
 - [Bootswatch](http://bootswatch.com/)
 - [Font-awesome](http://fontawesome.io/)
 - [jQuery](http://jquery.com/)
 - [Respond.js](http://github.com/scottjehl/Respond)
* [SCSS](http://sass-lang.com)
* [Coffeescript](http://coffeescript.org/)

##Installation

1. If you're just getting started, install the `middleman` gem
1. Download/clone blog-boostrap to `.middleman/blog-bootstrap`: 
1. Download/clone this repo
1. Install the assets in the `bower_components/` directory.

```shell
gem install middleman
git clone https://github.com/biblichor/middleman-blog-bootstrap-template.git ~/.middleman/blog-bootstrap
git clone https://github.com/payneio/read.git ~/{wherever you put your projects}/read
cd ~/{wherever you put your projects}/read
bower install
```

##Management

Start up the middleman server to see the live-reloading changes to your blog locally:

```shell
middleman server
```

Then, just write a new post in posts (in .md or .adoc). When ready to publish:

```shell
middleman build
middleman deploy
```

##Configuration

###Blog configuration

* Edit `config.rb` as you like.
 - Don't forget to add the site url, author, title, and subtitle(used as description too).
 - To get analytics inclusion, simply add your account name to the appropriate places.

```ruby:config.rb
set :site_url, 'http://blog.url.com'
set :site_author, 'Blog author'
set :site_title, 'Blog title'
set :site_subtitle, 'Blog subtitle'
# set @analytics_account, like 'XX-12345678-9'
@analytics_account = false
```

###Bower configuration

* With bower, you can prevent unnecessary files being copied over to ```build/```.
* All bower packages are put in the ```bower_components/``` directory outside of the source. 
* By default, these assets are included:
 - [Normalize.css](http://necolas.github.com/normalize.css) 
 - [Modernizr](http://modernizr.com)
 - [Font-awesome](http://fontawesome.io/)
 - [jQuery](http://jquery.com/)
 - [Respond.js](http://github.com/scottjehl/Respond)
* If you want another assets, edit `bower.json` as you like, and simply ```bower install``` and include it like you would any other file in sprockets.

##Requirements
Confirmed in ruby 2.0.0p247, rubygem 2.0.3, middleman 3.2.2

###Helpers configuration, etc.

* In ```helpers/```, a few helpers are inclueded to help out with organizing the following information on your site.
 - title
 - meta keywords
 - meta description
* ```feed.xml``` and ```sitemap.xml``` enables you to tell your readers / search engines the update of articles.

