###
  TBODY VIEW
  @param [Object] options
  @options [Backbone.Collection | Object] columns
###


class CafeGrid.Views.Body extends Backbone.View

  tagName: "tbody"

  events: {
    "click tr": "rowSelect"
  }

  Columns = CafeGrid.Models.Columns
  Grid = CafeGrid.Models.Grid

  initialize: (options) ->
    # Set Column model
    @columns = if options.columns instanceof Backbone.Collection then options.columns else new Columns(options.columns)
#    console.log @columns.toJSON()
    @gridInfo = if options.gridInfo instanceof Backbone.Model then options.gridInfo else new Grid(options.gridInfo)

    @.$el.css("position", "absolute") unless @gridInfo.get("scroll")


    @collection = options.collection
    @row = options.row || CafeGrid.Views.Row
    @rows = @collection.map (
      (model) ->  new @row({
        columns: @columns
        model: model
      })
      ), @

    @listenTo @collection, "reset", @refresh()

    # TODO
#  insertRow: (model, collection, option) ->
#    if !(collection instanceof Backbone.Collection) && !options
#      @collection.add(model, options = collection)
#
#
#  removeRow: ->
#    @body.removeRow(arguments)
#    @

  refresh: ->
#    alert "body refresh."
    @remove
#    console.log "body refleshing..." + @collection.toJSON()
    @rows = @collection.map (
      (model) -> new @row({
        columns: @columns
        model: model
      })
      ), @

    @render()
    @collection.trigger("cafe-grid:refresh", @)
    @

  remove: ->
    _.each @rows, (row) -> row.remove()
    super

  render: ->
    @.$el.empty()
    console.log "body rendering..."

    fragment = document.createDocumentFragment()
    _.each @rows, (row) -> fragment.appendChild(row.render().el)

    @.el.appendChild(fragment)
    @delegateEvents()
    @

  rowSelect: (event) ->
    if @gridInfo.get("multiSelect")
      @multiSelect(event)
    else
      @singleSelect(event)

  multiSelect:(event) ->
    # alert event
    _.each @rows, (row) -> 
      if event.currentTarget == row.el
        if row.$el.hasClass("row-selected")
          row.$el.removeClass("row-selected")
        else
          row.$el.addClass("row-selected")
    @delegateEvents()
    @

  singleSelect:(event) ->
    _.each @rows, (row) -> 
      row.$el.removeClass("row-selected")
      if event.currentTarget == row.el
        row.$el.addClass("row-selected")
    @delegateEvents()
    @    