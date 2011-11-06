$("#response-text-area").html(" ")
$("#responses").prepend("<%= escape_javascript render(@response) %>")

$("#question-responses-count").text("<%= escape_javascript pluralize(@response.respondable.count, "response") %>")

$("#question-responses-count").animate({fontSize:'18px'},200, "swing").animate({fontSize:"14px"}, 800, "swing")
$("#response-text-area").css({placeholder:"Your response here"}).unfocus()
