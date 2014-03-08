#class CafeGrid.Views.HeaderCell extends Backbone.View
class CafeGrid.Views.HeaderCell extends CafeGrid.Views.Cell

  tagName: "th"

#  events:
#    "click a": "onClick"

  Column = CafeGrid.Models.Column

  initialize: (options) ->
#    @column = if options.column instanceof Column then options.column else new Column(options.column)
    super
    @listenTo @column, "change:name change:label", @render()

  render: () ->
    console.log "render header cell."
    @.$el.empty()

    label = document.createTextNode(@column.get("label"))
    @.$el.append(label)

    @.$el.addClass(@column.get("name"))
#    @trigger("cafe-grid-row:render-cell", @)
    @delegateEvents()
    @


class CafeGrid.Views.HeaderRow extends CafeGrid.Views.Row
  initialize: ->
    super

  makeCell: (column, options) ->
    headerCell = column.get("headerCell") || options.headerCell || CafeGrid.Views.HeaderCell
    headerCell = new headerCell({
      column: column
      collection: @collection
    })
    headerCell



class CafeGrid.Views.Header extends Backbone.View

  tagName: "thead"

  Columns = CafeGrid.Models.Columns

  width = 1

  initialize: (options) ->
    # Set Column model
    @columns = if options.columns instanceof Backbone.Collection then options.columns else new Columns(options.columns)
#    console.log @columns.toJSON()

    @row = new CafeGrid.Views.HeaderRow({
      columns: @columns
      collection: @collection
    })

    @listenTo @row, "cafe-grid-row:render-cell", (cell) -> @addCellWidth(cell)
    @

  render: () ->
    console.log "table header rendering"
    @.$el.append(@row.render().$el)
    @delegateEvents()
    @

  remove: () ->
    @row.remove()
    super

  addCellWidth: (cell) ->
    console.log "addCellWidth:#{cell.column.get("width")}: #{width}"

    width += parseInt(cell.column.get("width")) + 5 if cell.column.get("visible")
    @.$el.css("width", "#{width}px")

