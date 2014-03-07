

class CafeGrid.Models.Column extends Backbone.Model

  defaults:
    name: undefined
    label: undefined
    sortable: true
    editable: true
    visible: true
    formatter: undefined
    fixed: false
    cell: undefined
    headerCell: undefined
    width: "100px"

  initialize: ->
    @set({label: @get("name")}, {silent: true}) unless @has("label")

    # 文字列からクラスを取得
    Resolver = CafeGrid.Utils.Resolver
    cell = Resolver.resolveView("Cell")
    headerCell = Resolver.resolveView("HeaderCell")

    @set({cell: cell, headerCell: headerCell})


class CafeGrid.Models.Columns extends Backbone.Collection
  model: CafeGrid.Models.Column

