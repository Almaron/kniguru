$(document).ready ->
  $('a.popup').click ->
    return false

  $('.fancybox_ajax').fancybox
    type: 'ajax',
    autoSize	: true

  wh = $(window).height()
  offs = $('.footer').offset()
  if (offs.top+50 < wh)
    $('.footer').css('position','fixed').css('bottom','0').css('width','100%')