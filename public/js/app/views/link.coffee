Toolboxes.Views.Link = Backbone.View.extend
  tagName: 'li'
  className: 'link'
  template: '#link-view-template'

  events:
    'mouseover .btn': '_enableDrag'
    'dragstart': '_dragStart'
    'dragstop': '_dragStop'

  rendered_template: ->
    template_html = $(@template).html()
    _.template(template_html, @model.attributes)

  initialize: ->
    @el       = $(@el)

  render: ->
    @el.html(@rendered_template())

  _dragStart: ->
    @el.css("opacity", "0.5")

  _dragStop: ->
    @el.css("opacity", "1")

  _enableDrag: (event) ->
    @el.draggable
      handle: '.btn'
      revert: true
