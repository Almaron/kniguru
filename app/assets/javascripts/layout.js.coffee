$(document).ready ->
  $('a.popup').click ->
    return false

  $('.fancybox_ajax').fancybox
    type: 'ajax',
    autoSize	: true