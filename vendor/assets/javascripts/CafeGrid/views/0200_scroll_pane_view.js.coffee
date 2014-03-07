###############################
#  CafeGrid.Views.ScrollPane
###############################

class CafeGrid.Views.ScrollPane extends Backbone.View

  tagName: "div"

  id: "cafe-grid-scroll"

#  className: "cafe-grid"

  gridView: CafeGrid.Views.Grid

  Grid = CafeGrid.Models.Grid

  ### Constructor ###

  initialize: (options) ->
    # Set Column model
    @gridInfo = if options.gridInfo instanceof Backbone.Model then options.gridInfo else new Grid(options.gridInfo)

    console.log "scroll pane initialized."

    # Set table
    @view = new @gridView(options) if @gridInfo

#    @listenTo @, "cafe-grid:renderd", (() ->
#    @listenTo @view, "cafe-grid:renderd", (() ->
    @listenTo @, "cafe-grid-scroll:renderd", (() ->

      thead = $("table.cafe-grid thead")
      theadFixed = $(".cafe-grid thead tr th.fixed")
      tbodyFixed = $(".cafe-grid tbody tr td.fixed")

      fixTable = (target) ->
        left = target.scrollLeft
        thead.css("left", "#{left * -1}px")
        offset = 0
        theadFixed.css("left", "#{left - offset}px")
        tbodyFixed.css("left", "#{left - offset}px")
        @

      if @gridInfo.get("scroll")
        $("#cafe-grid-scroll").scroll ->
          fixTable(@)
        @), @view

    @

  render: ->
    @.$el.empty()

    @.$el.append(@view.render().$el)
    alert ("cafe-grid-scroll:renderd")
#    @trigger("cafe-grid-scroll:renderd")
    @

  remove: ->
    @view.remove()
    super

