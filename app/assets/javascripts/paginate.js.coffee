jQuery ->
  jQuery.noConflict()
  $(".pagination a").live "click", ->
    $("#questions").html('<%=escape_javascript (image_tag "loading-machine.gif")  %>')
    $.getScript(@href)
    return false
