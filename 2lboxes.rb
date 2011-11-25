require 'rubygems'
require 'bundler'

Bundler.require

$db ||= {
  toolboxes: {
    1 => {
      id: 5,
      label: "Web Design"
    },
    35 => {
      id: 35,
      label: "Programming",
    }
  },
  links: {
    1 => {
      id:    1,
      title: "Google",
      url:   "http://google.com"
    },
    3 => {
      id:    3,
      title: "Be Genius",
      url:   "http://bjeanes.com"
    },
    4 => {
      id:    4,
      title: "Reddit",
      url:   "http://reddit.com"
    }
  },
  trays: {
    5 => {
      toolbox_id: 35,
      id: 5,
      label: "Ruby/Rails"
    },
    7 => {
      toolbox_id: 1,
      id: 7,
      label: "Textures"
    },
    9 => {
      toolbox_id: 1,
      id: 9,
      label: "Patterns"
    },
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
rest :trays
