unless window.jasmineSpecsAreRunning
  $ ->
    Toolboxes.router = new Toolboxes.Routers.App()
    Backbone.history.start
      pushState: true

