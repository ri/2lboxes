Toolboxes.Views.Toolbox = Backbone.View.extend
  className: "span5 toolbox"
  template: "#toolbox-view-template"

  colors: ["blue", "orange", "red", "yellow", "green"]

  initialize: ->
    @el = $(@el)
    @template = $(@template).html()

    color = @colors[Math.floor(Math.random() * @colors.length)]
    @el.addClass(color)

    @model.trays.bind('add', @addTray, @)
    @model.trays.bind('reset', @resetTrays, @)
    @model.trays.fetch()
    @

  render: ->
    @el.html(_.template(@template, @model.toJSON()))
    @

  addTray: (model, collection, options) ->
    options ||= {quiet: false}

    view = new Toolboxes.Views.Tray(model: model)
    view.render()

    @$('ul.trays').append(view.el)

    @trigger('changed:trays') unless options.quiet

  resetTrays: (collection) ->
    self = @
    collection.each (model) ->
      self.addTray(model, collection, quiet: true)

    @trigger('changed:trays')

