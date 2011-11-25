unless window.jasmineSpecsAreRunning
  $ ->
    Toolboxes.router = new Toolboxes.AppRouter()
    Backbone.history.start
      pushState: true

