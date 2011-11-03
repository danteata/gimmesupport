jQuery ->
  jQuery.noConflict()
  $(".pagination a").live "click", ->
    $.getScript(@href)
    return false
