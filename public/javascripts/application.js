// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() { 
  $(document)                                       .ready(hideBackground);
  $('#video img')                                   .live('click', showYouTubeVideo);
  $('#video a')                                     .live('click', showYouTubeVideo);
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

  function showYouTubeVideo(e) {
    if ($('div#title').html() == "Videos") {
      e.preventDefault();

      $('#overlay').show();
      $('#window').show();
      $('#window').find("div").show();
      $('.youtube-box').show();

      var winHeight = "425",
          winWidth = $(".youtube-box object").outerWidth(true) + 20,
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
    $(this).children('ul.second_level').slideDown('fast');
  }

  function menuSlideUp(e) {
    $(this).children('ul.second_level').slideUp('fast');
  }
});

