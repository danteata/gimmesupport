$("#response-text-area").html(" ")
$("#new_response").before('<div id="flash_notice"><%= escape_javascript(flash[:notice]) %></div>').timeOut(fadeOut(), 5000)
$("#responses").prepend("<%= escape_javascript render(@response) %>")

$("#question-responses-count").text("<%= escape_javascript pluralize(@response.respondable.responses.count, "response") %>").animate({fontSize:'18px'},200, "swing").animate({fontSize:"14px"}, 800, "swing")
$("#response-text-area").css({placeholder:"Your response here"}).focus_lost()
