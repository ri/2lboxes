Toolboxes.Views.Toolbox = Backbone.View.extend
  className: "span5 toolbox blue"
  template: "#toolbox-view-template"

  initialize: ->
    @el = $(@el)
    @template = $(@template).html()

    @model.trays.bind('add', @addTray, @)
    @model.trays.bind('reset', @resetTrays, @)
    @model.trays.fetch()
    @

  render: ->
    @el.html(_.template(@template, @model.toJSON()))
    @

  addTray: (model, collection) ->
    view = new Toolboxes.Views.Tray(model: model)
    view.render()

    @$('ul.trays').append(view.el)

  resetTrays: (collection) ->
    self = @
    collection.each (model) ->
      self.addTray(model, collection)

