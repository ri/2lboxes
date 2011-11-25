Toolboxes.TrayView = Backbone.View.extend
  tagName: 'li'
  template: '#tray-view-template'

  events:
    'dropover': '_dropOver'
    'dropout':  '_dropOut'
    'drop':     '_drop'

  initialize: ->
    @el       = $(@el)
    @template = $(@template).html()

    @el.droppable
      accept: ".#{Toolboxes.LinkView.prototype.className}"
      tolerance: 'pointer'

  render: ->
    @el.html(_.template(@template, @model.toJSON()))

  _dropOver: ->
    @$('a').addClass "dragged"

  _dropOut: ->
    @$('a').removeClass "dragged"

  _drop: (event, ui) ->
    @_dropOut()

    console.log("dropping #{event.srcElement.innerText}")
