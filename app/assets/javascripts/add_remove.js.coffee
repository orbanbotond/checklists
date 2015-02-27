$ ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(('input[type=hidden]'),$(this).closest('.row')).val('true')
    $(this).closest('.row').hide()
    $('.alert-please-update').removeClass('hidden')
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $('.row.task:last', $(this).closest('form')).after($(this).data('fields').replace(regexp, time))
    event.preventDefault()