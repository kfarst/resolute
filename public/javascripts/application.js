// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() { 
  $(document)                                       .ready(hideBackground);
  $('#panel')                                       .live('click', panelAsLink);
  //$('li.first_level')                               .live('hover', menuSlideDown);
  //$('li.first_level')                               .live('mouseleave', menuSlideUp);

  function hideBackground(e) {
    if ($('div#panel').length > 0) {
      $('div#content').css('background-color', 'transparent');
    }
  }

  function panelAsLink(e) {
    var url = $(this).children()[0].innerHTML.toLowerCase().replace(" ", "-");
    window.location.replace(e.view.location.href + url);
  }

  function menuSlideDown(e) {
    $(this).children('ul.second_level').slideDown('slow', function(){});
  }

  function menuSlideUp(e) {
    $(this).children('ul.second_level').slideUp('slow', function(){});
  }
});
