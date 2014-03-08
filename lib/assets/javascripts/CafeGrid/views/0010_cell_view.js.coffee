class CafeGrid.Views.Cell extends Backbone.View

  tagName: "td"

  Column = CafeGrid.Models.Column

  initialize: (options) ->
    @column = if options.column instanceof Column then options.column else new Column()

    fixed = @column.get("fixed")
    @.$el.addClass("fixed") if fixed

    # CSS style setting
    width = @column.get("width")
    @.$el.css("width", width) if width

#    @listenTo @model, "change:" + @column.get("name"), @render()

  render: () ->
    return @ unless @model
    @.$el.empty()
#    @model
#    console.log "cell rendering" + @model.get(@column.get("name"))

    @.$el.text @model.get(@column.get("name"))
#    @trigger("cafe-grid-row:render-cell", @)
    @delegateEvents()
    @

  remove: () ->
    super

