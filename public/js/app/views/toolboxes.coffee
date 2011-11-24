Toolboxes.Views.Toolboxes = Backbone.View.extend
  className: 'content'
  id: 'toolboxes'

  initialize: ->
    @el = $(@el)

    @collection = new Toolboxes.Collections.Toolboxes()
    @collection.bind('add', @addToolbox, @)
    @collection.bind('reset', @resetToolboxes, @)
    @collection.fetch()

    @

  addToolbox: (model, collection) ->
    view = new Toolboxes.Views.Toolbox(model: model)
    view.render()
    @el.append(view.el)

  resetToolboxes: (collection) ->
    _this = @
    collection.each (model) ->
      _this.addToolbox(model, collection)


