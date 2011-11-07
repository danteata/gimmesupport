$("#query-text-area").html(" ")
$("#questions").prepend("<%= escape_javascript render(@question) %>")

$("#community-questions-count").text("<%= escape_javascript pluralize(@question.community.questions.count, "question") %>").animate({fontSize:'18px'},200, "linear").animate({fontSize:"14px"}, 800, "linear")
$("#community-members-count").text("<%= escape_javascript pluralize(@question.community.members.count, "member") %>") unless $("#community-members-count").text() =  "<%=@question.community.members.count %>"
$("#member-total-questions").text("<%= escape_javascript pluralize(@question.member.questions.count, "question") %>").animate({fontSize:'18px'},200, "swing").animate({fontSize:"14px"}, 800, "swing")
$("#member-total-questions-community").text("<%= escape_javascript pluralize((@question.member.questions & @question.community.questions).count, "question") %>").animate({fontSize:'18px'},200, "swing").animate({fontSize:"14px"}, 800, "swing")

$("#query-text-area").css({placeholder:"Ask questions here!"}).unfocus()
