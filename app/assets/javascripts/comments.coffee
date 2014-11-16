$ ->
  # Display comments and form
  $('#show-comments').click ->
    $(this).toggle()
    $('#comment-form').toggle()

  # Validate comment form
  isValidComment = ->
    $('#comment_text').val().length > 0

  $('#comment_text').on 'change keyup paste', ->
    $('#comment-form input[type=submit]').prop 'disabled', !isValidComment()
