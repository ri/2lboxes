Toolboxes.Views.Link = Backbone.View.extend
  tagName: 'li'
  className: 'link'

  template: '#link-view-template'

  rendered_template: ->
    template_html = $(@template).html()
    _.template(template_html, @model.attributes)

  initialize: ->
    @el       = $(@el)

  render: ->
    @el.html(@rendered_template())

