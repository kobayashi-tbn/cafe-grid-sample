###############################
#  CafeGrid.Views.Grid
###############################

class CafeGrid.Views.Grid extends Backbone.View

  tagName: "table"

  className: "cafe-grid"

  header: CafeGrid.Views.Header

  body: CafeGrid.Views.Body

  Columns = CafeGrid.Models.Columns

  ### Constructor ###

  initialize: (options) ->
    # Set Column model
    @columns = if options.columns instanceof Backbone.Collection then options.columns else new Columns(options.columns)
#    console.log @columns.toJSON()
    console.log "grid initialized."

    # Set body
    @body = new @body(options) if @body

    @header = options.header || @header
    @header = new @header(options) if @header

    @listenTo @header, "cafe-grid-row:render-cell", (cell) ->
      @header.addCellWidth(cell)
      @header


    @listenTo @columns, "reset", () ->
#      alert "collection reset!"
      if @header
        @header = new @header.remove().constructor({})
      @body = new @body.remove().constructor({})
      @render()

#    @listenTo @, "cafe-grid:renderd", (() ->
#
#      thead = $("table.cafe-grid thead")
#      theadFixed = $(".cafe-grid thead tr th.fixed")
#      tbodyFixed = $(".cafe-grid tbody tr td.fixed")
#
#      fixTable = (target) ->
#        left = target.scrollLeft
#        thead.css("left", "#{left * -1}px")
#        offset = 0;
#        theadFixed.css("left", "#{left - offset}px")
#        tbodyFixed.css("left", "#{left - offset}px")
#        @
#
#      $("#cafe-grid-scroll").scroll ->
#        fixTable(@)
#      @), @
    @

  insertRow: ->
    @body.insertRow(arguments)
    @

  removeRow: ->
    @body.removeRow(arguments)
    @

  render: ->
    @.$el.empty()
    console.log "grid renderd."
    if @header
      @.$el.append(@header.render().$el)

    @.$el.append(@body.render().$el)
    @trigger("cafe-grid:renderd")
    @

  remove: ->
    @header && @header.remove()
    @body.remove()
    super

