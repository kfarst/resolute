// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery(function($) { 
  $(document)                                       .ready(hideBackground);
  $(document)                                       .ready(listSort);
  $(document)                                       .ready(listSortStaff);
  $(document)                                       .ready(listSortTournament);
  $(document)                                       .ready(addSpanTags);
  $(document)                                       .ready(dropdownSliding);

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
    if ($('div#slider').length > 0) {
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

  function remove_fields(link) {  
      jQuery(link).prev("input[type=hidden]").val("1");  
      jQuery(link).closest(".field").hide();  
  }  
    
  function add_fields(link, association, content) {  
      var new_id = new Date().getTime();  
      var regexp = new RegExp("new_" + association, "g");  
      jQuery(link).parent().before(content.replace(regexp, new_id));  
  }  

  function addSpanTags(e) {
    $("ul.subnav").parent().append("<span></span>"); //Only shows drop down trigger when js is enabled (Adds empty span tag after ul.subnav*)  
  }
  
  function dropdownSliding(e) {
    $("ul.topnav li span").hover(function() { //When trigger is clicked...  

        //Following events are applied to the subnav itself (moving subnav up and down)  
        $(this).parent().find("ul.subnav").slideDown('fast').show(); //Drop down the subnav on click  

        $(this).parent().hover(function() {  
        }, function(){  
            $(this).parent().find("ul.subnav").slideUp('slow'); //When the mouse hovers out of the subnav, move it back up  
        });  

        //Following events are applied to the trigger (Hover events for the trigger)  
        }).hover(function() {  
            $(this).addClass("subhover"); //On hover over, add class "subhover"  
        }, function(){  //On Hover Out  
            $(this).removeClass("subhover"); //On hover out, remove class "subhover"  
    });  
  }

});
