Toolboxes.AppRouter = Backbone.Router.extend
  routes:
    "": "default"

  default: ->
    view = new Toolboxes.AppView()
    view.render()
