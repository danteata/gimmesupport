$("#query-text-area").html(" ")
$("#comments").prepend("<%= escape_javascript render(@question) %>")

$("#community-questions-count").text("<%= escape_javascript pluralize(@question.community.questions.count, "question") %>")
$("#community-members-count").text("<%= escape_javascript pluralize(@question.community.members.count, "member") %>")
$("#member-total-questions").text("<%= escape_javascript pluralize(@question.member.questions.count, "question") %>")
$("#member-total-questions-community").text("<%= escape_javascript pluralize((@question.member.questions & @question.community.questions).count, "question") %>")

$(".stats").animate({fontSize:'18px'},200, "swing").animate({fontSize:"14px"}, 800, "swing")
$("#query-text-area").css({placeholder:"Ask more questions"}).unfocus()
