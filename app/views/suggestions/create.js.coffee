$("#suggestion-text-area").html(" ")
$("#suggestions").prepend("<%= escape_javascript render(@suggestion) %>")

$("#community-suggestions-count").text("<%= escape_javascript pluralize(@suggestion.community.suggestions.count, "suggestion") %>").animate({fontSize:'18px'},200, "swing").animate({fontSize:"14px"}, 800, "swing")
$("#community-members-count").text("<%= escape_javascript pluralize(@suggestion.community.members.count, "member") %>")
$("#member-total-suggestions").text("<%= escape_javascript pluralize(@suggestion.member.suggestions.count, "suggestion") %>").animate({fontSize:'18px'},200, "swing").animate({fontSize:"14px"}, 800, "swing")
$("#member-total-suggestions-community").text("<%= escape_javascript pluralize((@suggestion.member.suggestions & @suggestion.community.suggestions).count, "suggestion") %>").animate({fontSize:'18px'},200, "swing").animate({fontSize:"14px"}, 800, "swing")

$(".stats").animate({fontSize:'18px'},200, "swing").animate({fontSize:"14px"}, 800, "swing")
$("#suggestion-text-area").css({placeholder:"Make your suggestions here"}).unfocus()
