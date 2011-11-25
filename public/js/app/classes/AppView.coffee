Toolboxes.AppView = Backbone.View.extend
  el: '#main'

  initialize: ->
    @links     = new Toolboxes.LinksView()
    @toolboxes = new Toolboxes.ToolboxesView()

    @links.render()
    @toolboxes.render()

    @

  render: ->
    $(@el).append(@links.el)
    $(@el).append(@toolboxes.el)
    @

