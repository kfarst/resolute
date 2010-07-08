// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() { 
  $(document)                                       .ready(hideBackground);
  $(document)                                       .ready(showIntroVideo);
  $('#video img')                                   .live('click', showYouTubeVideo);
  $('#panel')                                       .live('click', panelAsLink);
  $('li.first_level')                               .live('hover', menuSlideDown);
  $('li.first_level')                               .live('mouseleave', menuSlideUp);
  $('#window #tab a')                               .live('click', hideVideo);

  function hideVideo(e) {
    e.preventDefault();
    $('#overlay').css('display', 'none');
  }

  function showYouTubeVideo(e) {
    if ($('div#title').html() == "Videos") {

      $('#overlay').css('display', 'block');
      $('.video-js-box').css('display', 'none');

      var winHeight = "385",
          winWidth = $(".youtube-box object").width(),
          halfHeight = ($(window).height() / 2) - (winHeight / 2);

      $('#window').css('height', winHeight + 'px')
                  .css('width', winWidth + 'px') 
                  .css('margin-top', halfHeight + 'px'); 
    }
  }

  function showIntroVideo(e) {
    if ($('div#panel').length > 0) {
      if ($('div#panel').first().hasClass('no_popup')) { return false; }

      $('#overlay').css('display', 'block');
      $('.youtube-box').css('display', 'none');
      
      var winHeight = $(".video-js-box video").height(),
          winWidth = $(".video-js-box video").width(),
          halfHeight = ($(window).height() / 2) - (winHeight / 2);

      $('#window').css('height', winHeight + 'px')
                  .css('width', winWidth + 'px') 
                  .css('margin-top', halfHeight + 'px'); 

      $('#window video').attr('autoplay', 'autoplay').attr('preload', 'preload');
    }
  }

  function hideBackground(e) {
    if ($('div#panel').length > 0) {
      $('div#content').css('background-color', 'transparent')
                      .css('-moz-box-shadow', 'none')
                      .css('-webkit-box-shadow', 'none');
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
