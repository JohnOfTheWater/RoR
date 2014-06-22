(function(){

  'use strict';

  $(document).on('page:load', initialize);
  $(document).ready(initialize);

  function initialize(){
    //$('#wrap').hide();
    //$('#hunter').click(showSecondo);
    $('#scroll_down').click(scrollToAnchor);
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
    $('#comment_comment').focus();
  }

  function closeComments(){
    $('.r_all_comments').animate({left: '-850px'},1000);
  }

  function showRatings(){
    $('.r_ratings').fadeToggle(300);
  }

  function scrollToAnchor(){
    $('html,body').animate({scrollTop: $('#here').offset().top}, 1500);
  }


})();
