
window.CafeGrid = {
  Models: {}
  Views: {}
  Utils: {}
}

class CafeGrid.Utils.Resolver
  # Class Method
  @resolveView: (nameString) ->
    CafeGrid.Views[nameString]


