$ ->

  tasks = new TaskApp.Models.TaskCollection()

  gridInfo = {
    visibleTitle: false
    title: undefined
    scroll: true
    multiSelect: true
    containerViewWidth: "400px"
    containerViewHeight: "100px"
    scrollPaneWidth: "400px"
    scrollPaneHeight: "100px"
  }

  columnInfo = [
    {
      name: "id"
      label: "ID"
      cell: CafeGrid.Views.Cell
      fixed: true
      width: "30px"
    },
    {
      name: "title"
      label: "タイトル"
      fixed: true
      width: "100px"
    },
    {
      name: "content"
      label: "CONTENT"
      width: "150px"
    },
    {
      name: "limit_on"
      label: "期限"
    },
    {
      name: "done"
      label: "DONE"
    }
    ]

  tasks.fetch({
    reset: true
    success: (tasks) ->
      pane = new CafeGrid.Views.ScrollPane({
        columns: columnInfo
        collection: tasks
        gridInfo: gridInfo
      })

      $("#cafe-grid-container").append(pane.render().el)
      pane.trigger("cafe-grid-scroll:renderd")

  })










