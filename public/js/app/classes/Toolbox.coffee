Toolboxes.Toolbox = Backbone.Model.extend
  initialize: ->
    @trays = new Toolboxes.Trays()
    @
