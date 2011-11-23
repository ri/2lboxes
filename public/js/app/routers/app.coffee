Toolboxes.Routers.App = Backbone.Router.extend
  routes:
    "": "default"

  default: ->
    view = new Toolboxes.Views.App()
    view.render()
