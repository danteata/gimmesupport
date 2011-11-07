$("\##{@response.respondable_type.downcase}_#{@response.respondable.id}-response-text-area").html(" ")
$("\##{@response.respondable_type.downcase}_#{@response.respondable.id}-new_response").before('<div id="flash_notice"><%= escape_javascript(flash[:notice]) %></div>').timeOut(fadeOut(), 5000)
$("\##{@response.respondable_type.downcase}_#{@response.respondable.id}-responses-count").text("something here!")
$("\##{@response.respondable_type.downcase}_#{@response.respondable.id}-responses").prepend("<%= escape_javascript render(@response) %>")


$("##{@response.respondable_type.downcase}_#{@response.respondable.id}-new_response > form")[0].reset()
$("#<%="#{@response.respondable_type.downcase}_#{@response.respondable.id}-"%>response-text-area").css({placeholder:"Your response here"}).focus_lost()
