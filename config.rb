###
# Blog settings
###

# Time.zone = "UTC"

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"

  # blog.permalink = "{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
  blog.sources = "posts/{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  blog.layout = "layout"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  blog.default_extension = ".md"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  blog.paginate = true
  blog.per_page = 10
  # blog.page_link = "page/{num}"
end

page "/feed.xml", layout: false
page "/sitemap.xml", layout: false

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

# Change Compass configuration
# config :development do
  compass_config do |config|
    config.sass_options = {:debug_info => true}
  end
# end

###
# Page options, layouts, aliases and proxies
###

# Slim settings
Slim::Engine.set_default_options :pretty => true
# shortcut
Slim::Engine.set_default_options :shortcut => {
  '#' => {:tag => 'div', :attr => 'id'},
  '.' => {:tag => 'div', :attr => 'class'},
  '&' => {:tag => 'input', :attr => 'type'}
}

# Markdown settings 
set :markdown, :tables => true, :autolink => true, :gh_blockcode => true, :fenced_code_blocks => true, :with_toc_data => true
set :markdown_engine, :redcarpet
set :asciidoc_attributes, %w(source-highlighter=coderay coderay-css=style imagesdir=images)

page "/posts/*", layout: :article

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

###
# Site Settings
###
# Set site setting, used in helpers / sitemap.xml / feed.xml.
set :site_url, 'http://read.payne.io'
set :site_author, 'Paul Payne'
set :site_title, 'Read'
set :site_description, 'Posts by Paul Payne'

@analytics_account = "UA-38495728-2"

# Asset Settings
set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'images'

after_configuration do
  @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
  Dir.glob(File.join("#{root}", @bower_config["directory"], "*", "fonts")) do |f|
    sprockets.append_path f
  end
  sprockets.append_path File.join "#{root}", @bower_config["directory"]
end


###
# Target settings
###

# To build the target of "android" you would run:
# MIDDLEMAN_BUILD_TARGET=android middleman build

# require 'middleman-target'
# activate :target do |target|

#  target.build_targets = {
#    "phonegap" => {
#      :includes => %w[android ios]
#    }
#  }

# end

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash # cache buster
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

###
# Deploy settings
###

activate :deploy do |deploy|
  deploy.method = :rsync
  deploy.host   = 'read.payne.io'
  deploy.path   = '/home/payne/read'
  deploy.user   = 'payne'
  # deploy.clean = true # remove orphaned files on remote host, default: false
  # deploy.flags = '-rltgoDvzO --no-p --del' # add custom flags, default: -avz
end
