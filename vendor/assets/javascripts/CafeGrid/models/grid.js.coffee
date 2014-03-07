class CafeGrid.Models.Grid extends Backbone.Model

  defaults:
#    name: "cafe-grid"  # Class name
    visibleTitle: false
    title: undefined
    scroll: false
    containerView: undefined
    containerViewWidth: "400px"
    containerViewHeight: "200px"
    scrollPane: undefined
    scrollPaneWidth: "400px"
    scrollPaneHeight: "200px"

  initialize: ->
    containerView = CafeGrid.Utils.Resolver.resolveView("Conteiner")
    scrollPane = CafeGrid.Utils.Resolver.resolveView("ScrollPane")

    @set({containerView: containerView, scrollPane: scrollPane})



