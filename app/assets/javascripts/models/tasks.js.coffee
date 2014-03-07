#class TaskApp.Models.Task extends Backbone.Model
class TaskApp.Models.Task extends CafeGrid.Models.Record

#class TaskApp.Models.TaskCollection extends Backbone.Collection
class TaskApp.Models.TaskCollection extends CafeGrid.Models.Table
  model: TaskApp.Models.Task
  url: "/tasks"
#  parse: (resp) ->
#    @models = resp



