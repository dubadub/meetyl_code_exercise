$('<%= j render @comment %>').hide().appendTo('.comments').slideDown(350)

$('#comment_text').val('')
