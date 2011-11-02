$("#questions").append("<%= escape_javascript render(@question) %>");

$("#community-questions-count").text("<%= escape_javascript pluralize(@question.community.questions.count, "question") %>")
$("#community-members-count").text("<%= escape_javascript pluralize(@question.community.members.count, "member") %>")
$("#member-total-questions").text("<%= escape_javascript pluralize(@question.member.questions.count, "question") %>")
$("#member-total-questions-community").text("<%= escape_javascript pluralize((@question.member.questions & @question.community.questions).count, "question") %>")

