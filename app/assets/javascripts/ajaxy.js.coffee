app = {
  setupAjaxCallbacks: ->
    ($ "body").ajaxStart ->
      ($ "#ajax-status").show().text("Loading...")
}

jQuery ->
  app.setupAjaxCallbacks()

