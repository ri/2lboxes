Toolboxes.Views.Links = Backbone.View.extend
  id: 'links'
  className: 'sidebar'
  template: '#links-view-template'

  initialize: ->
    @el       = $(@el)
    @template = $(@template).html()

    @el.html(@template)

    @collection = new Toolboxes.Collections.Links()
    @collection.bind('add', @addLink, @)
    @collection.bind('reset', @resetLinks, @)
    @collection.fetch()

    @

  addLink: (model, collection) ->
    view = new Toolboxes.Views.Link(model: model)
    view.render()
    @$('ul').append(view.el)

  resetLinks: (collection) ->
    _this = @
    collection.each (model) ->
      _this.addLink(model, collection)

