$("#chat").append("<%= escape_javascript render(@chat) %>");

$("#new_chat")[0].reset();
