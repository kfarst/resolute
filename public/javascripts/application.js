// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery(function($) { 
  $(document)                                       .ready(hideBackground);
  $('#panel')                                       .live('click', panelAsLink);
  $('li.first_level')                               .live('hover', menuSlideDown);
  $('li.first_level')                               .live('mouseleave', menuSlideUp);
  $(document)                                       .ready(listSort);
  $(document)                                       .ready(listSortStaff);
  $(document)                                       .ready(listSortTournament);

  function listSortTournament(e) {
    $("#sortable-tournament-pages").sortable({
      update: function() {
        $.post("/tournament_pages/sort", $(this).sortable('serialize'));
      }
    });
		$("#sortable-tournament-page").disableSelection();
  }

  function listSortStaff(e) {
    $("#sortable-staff").sortable({
      update: function() {
        $.post("/staff_members/sort", $(this).sortable('serialize'));
      }
    });
		$("#sortable-staff").disableSelection();
  }

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
                      .css('background-image', 'none')
                      .css('box-shadow', 'none');
    }
  }

  function panelAsLink(e) {
    var path = $(this).attr('data-url');
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

  function remove_fields(link) {  
      jQuery(link).prev("input[type=hidden]").val("1");  
      jQuery(link).closest(".field").hide();  
  }  
    
  function add_fields(link, association, content) {  
      var new_id = new Date().getTime();  
      var regexp = new RegExp("new_" + association, "g");  
      jQuery(link).parent().before(content.replace(regexp, new_id));  
  }  
