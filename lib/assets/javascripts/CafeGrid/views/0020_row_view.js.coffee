

class CafeGrid.Views.Row extends Backbone.View

  tagName: "tr"

  Columns = CafeGrid.Models.Columns

  initialize: (options) ->
    # Set Column model
    @columns = if options.columns instanceof Backbone.Collection then options.columns else new Columns(options.columns)
#    console.log @columns.toJSON()

    @cells = @columns.map (
      (column) ->
        @makeCell(column, options)
      ), @

  makeCell: (column) ->
    cell = column.get("cell")
    new cell({
      column: column
      model: @model
    })


  render: () ->
    @.$el.empty()

    fragment = document.createDocumentFragment()
    _.each @cells, (cell) ->
      fragment.appendChild(cell.render().el)
      @trigger("cafe-grid-row:render-cell", cell)
    ,@

    @.el.appendChild(fragment)

    @delegateEvents()
    @

  remove: () ->
    _.each @cells, (cell) -> cell.remove()
    super


