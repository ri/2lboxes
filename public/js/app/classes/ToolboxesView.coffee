Toolboxes.ToolboxesView = Backbone.View.extend
  className: 'content'
  id: 'toolboxes'

  initialize: ->
    @el = $(@el)

    @collection = new Toolboxes.Toolboxes()
    @collection.bind('add', @addToolbox, @)
    @collection.bind('reset', @resetToolboxes, @)
    @collection.fetch()

    @el.isotope
      itemSelector: ".toolbox"
      layoutMode: "masonry"

    @

  addToolbox: (model, collection) ->
    view = new Toolboxes.ToolboxView(model: model)
    view.bind "changed:trays", (->
      @el.isotope('insert', view.el)),
      @
    view.render()

  resetToolboxes: (collection) ->
    _this = @
    collection.each (model) ->
      _this.addToolbox(model, collection)


