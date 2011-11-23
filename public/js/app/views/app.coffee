Toolboxes.Views.App = Backbone.View.extend
  el: '#main'

  initialize: ->
    @links     = new Toolboxes.Views.Links()
    @toolboxes = new Toolboxes.Views.Toolboxes()

    @links.render()
    @toolboxes.render()

    @

  render: ->
    $(@el).append(@links.el)
    $(@el).append(@toolboxes.el)
    @

