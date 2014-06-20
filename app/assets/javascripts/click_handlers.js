(function(){

  'use strict';

  $(document).on('page:load', initialize);
  $(document).ready(initialize);

  function initialize(){
    //$('#wrap').hide();
    //$('#hunter').click(showSecondo);
    $('#recipe_wrap').on('click', '.close_recipe', close_recipe);
    $('#recipe_wrap').on('click', '.comments', showComments);
    $('#recipe_wrap').on('click', '.close_comments', closeComments);
  }

  function close_recipe(){
    $('#recipe_wrap').fadeOut(500);
  }

  function showComments(){
    $('.r_all_comments').animate({left: '-420px'},1000);
  }

  function closeComments(){
    $('.r_all_comments').animate({left: '-850px'},1000);
  }


})();
