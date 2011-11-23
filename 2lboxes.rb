require 'rubygems'
require 'bundler'

Bundler.require

$db ||= {
  links: {
    1 => {
      id:    1,
      title: "Google",
      url:   "http://google.com"
    }
  }
}


use Rack::Less, {
  :source => 'public/css',
  :hosted_at => '/css'
}

use Rack::Coffee, {
  :root => 'public',
  :urls => ['/js']
}

def rest(model)
  options = {:provides => :json}

  $db[model] ||= {}

  get "/#{model}", options do
    $db[model].values.to_json
  end

  get "/#{model}/:id", options do
    $db[model][params[:id].to_i].to_json
  end

  post "/#{model}", options do
    id             = $db[model].keys.max + 1
    instance       = JSON.parse(request.body.read)
    instance[:id]  = id
    $db[model][id] = instance
    instance.to_json
  end

  put "/#{model}/:id", options do
    instance = JSON.parse(request.body.read)
    $db[model][instance["id"]] = instance
    instance.to_json
  end
end

set(:xhr) { |xhr| condition { xhr == request.xhr? } }

get '*', :xhr => false do
  haml :index
end

rest :links
rest :toolboxes
