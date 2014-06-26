(function(){

  'use strict';

  $(document).on('page:load', initialize);
  $(document).ready(initialize);

  function initialize(){
    $('#search_form').hide();
    $('#create_new_recipe').hide();
    $('#risultati').hide();
    //$('#hunter').click(showSecondo);
    $('#scroll_down').click(scrollToAnchor);
    $('#add_new_recipe').click(scrollToNewRecipe);
    $('#mostra').click(showRisultati);
    $('#recipe_wrap').on('click', '.close_recipe', close_recipe);
    $('#recipe_wrap').on('click', '.comments', showComments);
    $('#recipe_wrap').on('click', '.close_comments', closeComments);
    $('#recipe_wrap').on('click', '.r_rating', showRatings);

    var drags = '.fav_recipe_wrap';//add here your draggable divs
    var drops = '#drop_box, #monday, #tuesday';//add here your draggable divs

    $(function() {$(drags).draggable({helper: "clone"});});

    //-----monday-----//
    $(function() {$('#monday').droppable({accept: ".fav_recipe_wrap", drop: function(event, ui) {
      console.log(ui.draggable.find("img").attr("src"));
      //$('#day_day').val('monday');
      $('#monday_name').val(ui.draggable.find("p").text());
      $('#monday_image').val(ui.draggable.find("img").attr("src"));
      $('#drop_box').text(ui.draggable.find("p").text()).css('background', 'url('+ui.draggable.find("img").attr("src")+')').css('background-size', 'cover');
      $('#monday input.btn').css({
        'visibility' : 'visible',
        'position' : 'relative',
        'top' : '80px'
      }).hide().fadeIn(500);;
    }});});

    //-----tuesday-----//
    $(function() {$('#tuesday').droppable({accept: ".fav_recipe_wrap", drop: function(event, ui) {
      $('#tuesday_name').val(ui.draggable.find("p").text());
      $('#tuesday_image').val(ui.draggable.find("img").attr("src"));
      $('#drop_box_tuesday').text(ui.draggable.find("p").text()).css('background', 'url('+ui.draggable.find("img").attr("src")+')').css('background-size', 'cover');
      $('#tuesday input.btn').css({
        'visibility' : 'visible',
        'position' : 'relative',
        'top' : '80px'
      }).hide().fadeIn(500);;
    }});});

    //-----wednesday-----//
    $(function() {$('#wednesday').droppable({accept: ".fav_recipe_wrap", drop: function(event, ui) {
      $('#wednesday_name').val(ui.draggable.find("p").text());
      $('#wednesday_image').val(ui.draggable.find("img").attr("src"));
      $('#drop_box_wednesday').text(ui.draggable.find("p").text()).css('background', 'url('+ui.draggable.find("img").attr("src")+')').css('background-size', 'cover');
      $('#wednesday input.btn').css({
        'visibility' : 'visible',
        'position' : 'relative',
        'top' : '80px'
      }).hide().fadeIn(500);;
    }});});

    //-----thursday-----//
    $(function() {$('#thursday').droppable({accept: ".fav_recipe_wrap", drop: function(event, ui) {
      $('#thursday_name').val(ui.draggable.find("p").text());
      $('#thursday_image').val(ui.draggable.find("img").attr("src"));
      $('#drop_box_thursday').text(ui.draggable.find("p").text()).css('background', 'url('+ui.draggable.find("img").attr("src")+')').css('background-size', 'cover');
      $('#thursday input.btn').css({
        'visibility' : 'visible',
        'position' : 'relative',
        'top' : '80px'
      }).hide().fadeIn(500);;
    }});});

    //-----friday-----//
    $(function() {$('#friday').droppable({accept: ".fav_recipe_wrap", drop: function(event, ui) {
      $('#friday_name').val(ui.draggable.find("p").text());
      $('#friday_image').val(ui.draggable.find("img").attr("src"));
      $('#drop_box_friday').text(ui.draggable.find("p").text()).css('background', 'url('+ui.draggable.find("img").attr("src")+')').css('background-size', 'cover');
      $('#friday input.btn').css({
        'visibility' : 'visible',
        'position' : 'relative',
        'top' : '80px'
      }).hide().fadeIn(500);;
    }});});

    //-----saturday-----//
    $(function() {$('#saturday').droppable({accept: ".fav_recipe_wrap", drop: function(event, ui) {
      $('#saturday_name').val(ui.draggable.find("p").text());
      $('#saturday_image').val(ui.draggable.find("img").attr("src"));
      $('#drop_box_saturday').text(ui.draggable.find("p").text()).css('background', 'url('+ui.draggable.find("img").attr("src")+')').css('background-size', 'cover');
      $('#saturday input.btn').css({
        'visibility' : 'visible',
        'position' : 'relative',
        'top' : '80px'
      }).hide().fadeIn(500);;
    }});});

    //-----sunday-----//
    $(function() {$('#sunday').droppable({accept: ".fav_recipe_wrap", drop: function(event, ui) {
      $('#sunday_name').val(ui.draggable.find("p").text());
      $('#sunday_image').val(ui.draggable.find("img").attr("src"));
      $('#drop_box_sunday').text(ui.draggable.find("p").text()).css('background', 'url('+ui.draggable.find("img").attr("src")+')').css('background-size', 'cover');
      $('#sunday input.btn').css({
        'visibility' : 'visible',
        'position' : 'relative',
        'top' : '80px'
      }).hide().fadeIn(500);;
    }});});
  }

  function close_recipe(){
    $('#recipe_wrap').fadeOut(500);
  }

  function showComments(){
    $('.r_all_comments').animate({left: '-420px'},1000);
    //$('#comment_comment').focus();
  }

  function closeComments(){
    $('.r_all_comments').animate({left: '-850px'},1000);
  }

  function showRatings(){
    $('.r_ratings').fadeToggle(300);
  }

  function showRisultati(){
    $('#risultati').fadeToggle(300);
  }

  function scrollToAnchor(){
    $('#search_form').hide();
    $('#create_new_recipe').hide();
    $('html,body').animate({scrollTop: $('#here').offset().top}, 800, function(){
      $('#search_form').fadeIn(500, function(){
        $('#search_rating').focus();
      });
    });
  }

  function scrollToNewRecipe(){
    $('#search_form').hide();
    $('#create_new_recipe').hide();
    $('html,body').animate({scrollTop: $('#here').offset().top}, 800, function(){
      $('#create_new_recipe').fadeIn(500, function(){
        $('#new_name input').focus();//css background change
      });
    });
  }




//$($search_by_rating).delay(500).fadeIn(800, function(){
  //$($search_by_rating).focus();
//});
//$($s_b_r_text).delay(400).fadeIn(800);


})();
