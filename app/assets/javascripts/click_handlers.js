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

  var drags = '.fav_recipe_wrap, .days_wrap, #user_week';//add here your draggable divs
  var drops = '#drop_box';//add here your draggable divs

  $(function() {$(drags).draggable({helper: "clone"});});
  $(function() {$(drops).droppable({accept: ".fav_recipe_wrap", drop: function(){
    alert('it works');
  }});});


//$($search_by_rating).delay(500).fadeIn(800, function(){
  //$($search_by_rating).focus();
//});
//$($s_b_r_text).delay(400).fadeIn(800);


})();
