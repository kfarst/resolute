// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery(function($) { 
  $(document)                                       .ready(hideBackground);
  $('#panel')                                       .live('click', panelAsLink);
  $('li.first_level')                               .live('hover', menuSlideDown);
  $('li.first_level')                               .live('mouseleave', menuSlideUp);
  $(document)                                       .ready(listSort);
  // $('a#add_stat')                                   .live('click', addStatField);
  // $(document)                                       .ready(hideStatField);

  // function hideStatField(e) {
  //   e.preventDefault();
  //   $(e.target).remove();
  //   $(e.target).parent("form#stat_field").remove();
  // }

  // function addStatField(e) {
  //   e.preventDefault();
  //   var count = $("form#stat_field").size(),
  //       newField = $(e.target).parent("form#stat_field").clone();
  //   $(e.target).parent(".field").append(newField.attr("name", "staff_member[stats][" + count + "]"));
  // }

  function listSort(e) {
    $("#sortable").sortable({
      update: function() {
        $.post("/categories/sort", $(this).sortable('serialize'));
      }
    });
		$("#sortable").disableSelection();
  }

  function hideBackground(e) {
    if ($('div#panel').length > 0) {
      $('div#content').css('background-color', 'transparent')
                      .css('-moz-box-shadow', 'none')
                      .css('-webkit-box-shadow', 'none')
                      .css('background-image', 'none');
    }
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
