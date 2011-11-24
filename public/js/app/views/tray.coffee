Toolboxes.Views.Tray = Backbone.View.extend
  tagName: 'li'
  template: '#tray-view-template'

  initialize: ->
    @el       = $(@el)
    @template = $(@template).html()

  render: ->
    @el.html(_.template(@template, @model.toJSON()))
