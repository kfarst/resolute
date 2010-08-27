// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() { 
  $(document)                                       .ready(hideBackground);
  $('#video img')                                   .live('click', showYouTubeVideo);
  $('#panel')                                       .live('click', panelAsLink);
  $('li.first_level')                               .live('hover', menuSlideDown);
  $('li.first_level')                               .live('mouseleave', menuSlideUp);
  $('#window #tab a')                               .live('click', hideVideo);
  $(document)                                       .ready(listSort);

  function listSort(e) {
    $("#sortable").sortable({
      update: function() {
        $.post("/categories/sort", $(this).sortable('serialize'));
      }
    });
		$("#sortable").disableSelection();
  }

  function hideVideo(e) {
    e.preventDefault();
    $('#overlay').css('display', 'none');
  }

  function showYouTubeVideo(e) {
    if ($('div#title').html() == "Videos") {

      $('#overlay').css('display', 'block');
      $('.video-js-box').css('display', 'none');

      var winHeight = "425",
          winWidth = $(".youtube-box object").outerWidth(true),
          halfHeight = ($(window).height() / 2) - (winHeight / 2),
          halfWidth = ($(window).width() / 2) - (winWidth / 2),
          videoSource = $(this).attr('video_url'); 

      $('.youtube-box object param').first().attr('value',videoSource);
      $('.youtube-box').css('margin-top', '7px');
      $('.youtube-box object embed').attr('src', videoSource);

      $('#window').css('height', winHeight + 'px')
                  .css('width', winWidth + 'px') 
                  .css('margin-top', halfHeight + 'px') 
                  .css('margin-left', halfWidth + 'px'); 
    }
  }

  function showIntroVideo(e) {
    if ($('div#panel').length > 0) {
      if ($('div#panel').first().hasClass('no_popup')) { return false; }

      $('#overlay').css('display', 'block');
      $('.youtube-box').css('display', 'none');
      
      var winHeight = $(".video-js-box video").height() + 40,
          winWidth = $(".video-js-box video").width() + 10,
          halfWidth = ($(window).width() / 2) - (winWidth / 2),
          halfHeight = ($(window).height() / 2) - (winHeight / 2);

      $('#window').css('height', winHeight + 'px')
                  .css('width', winWidth + 'px') 
                  .css('margin-top', halfHeight + 'px') 
                  .css('margin-left', halfWidth + 'px'); 

      $('#window video').attr('autoplay', 'autoplay').attr('preload', 'preload');
      $('video.video-js').css('margin-top', '7px');
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
    var path = $(this).children()[0].innerHTML.toLowerCase().replace("&amp; ", "").replace(" ", "-"),
    url = e.view.location.href.split("/");
    window.location.replace(url [0] + "//" + url[2] + "/" + path);
  }

  function menuSlideDown(e) {
    $(this).children('ul.second_level').slideDown('slow', function(){});
  }

  function menuSlideUp(e) {
    $(this).children('ul.second_level').slideUp('slow', function(){});
  }
});
