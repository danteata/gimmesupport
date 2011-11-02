app = {
  setupAjaxCallbacks: ->
    ($ "body").ajaxStart ->
      jQuery.noConflict()
      ($ "#ajaxx-status").show().text("Loading...")
}
jQuery ->
  app.setupAjaxCallbacks()

