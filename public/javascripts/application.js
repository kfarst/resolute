// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() { 
  $(document)                                       .ready(hideBackground);
  $('#panel')                                       .live('click', panelAsLink);
  $('li.first_level')                               .live('hover', menuSlideDown);
  $('li.first_level')                               .live('mouseleave', menuSlideUp);
  $('#window #tab a')                               .live('click', hideVideo);
  $(document)                                       .ready(listSort);
  $(document)                                       .ready(hideVideo);

  function listSort(e) {
    $("#sortable").sortable({
      update: function() {
        $.post("/categories/sort", $(this).sortable('serialize'));
      }
    });
		$("#sortable").disableSelection();
  }

  function hideVideo(e) {
    if ($('.video-js-box').is(':visible')) $('video.video-js').pause();
    $('#overlay').hide();
    $('#window').hide();
    $('#window').find("div").hide();
  }

  function panelAsLink(e) {
    var path = $(this).attr('class');
    var url = $(location)[0];
    $(location).attr('href', url + path);
  }

  function menuSlideDown(e) {
    $(this).children('ul.second_level').slideDown('fast');
  }

  function menuSlideUp(e) {
    $(this).children('ul.second_level').slideUp('fast');
  }
});

