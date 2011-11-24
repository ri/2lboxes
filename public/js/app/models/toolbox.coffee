Toolboxes.Models.Toolbox = Backbone.Model.extend
  initialize: ->
    @trays = new Toolboxes.Collections.Trays()
    @
