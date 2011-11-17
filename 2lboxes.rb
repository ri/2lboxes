require 'rubygems'
require 'bundler'

Bundler.require

use Rack::Less, {
  :source => 'public/css',
  :hosted_at => '/css'
}

use Rack::Coffee, {
  :root => 'public',
  :urls => ['/js']
}

def json(route, options = {}, &block)
  options = {:provides => :json}.merge(options)
  args    = [route, options]

  get    *args, &block
  post   *args, &block
  put    *args, &block
  delete *args, &block
end

set(:xhr) { |xhr| condition { xhr == request.xhr? } }

get '*', :xhr => false do
  haml :index
end

