$('<%= escape_javascript "\##{@response.respondable_type.downcase}_#{@response.respondable.id}-responses"%>').before('<div id="flash_notice"><%= escape_javascript(flash[:notice]) %></div>')
$('<%= escape_javascript "\##{@response.respondable_type.downcase}_#{@response.respondable.id}-responses"%>').append "<%= escape_javascript render @response %>"
$('<%= escape_javascript "\##{@response.respondable_type.downcase}_#{@response.respondable.id}-responses-count"%>').html '<%= escape_javascript pluralize(@response.respondable.responses.count, @response.class.name.downcase) %>'

$('<%= escape_javascript "\##{@response.respondable_type.downcase}_#{@response.respondable.id}-response-text-area"%>').text("")
