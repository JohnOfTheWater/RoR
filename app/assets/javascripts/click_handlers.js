(function(){

  'use strict';

  $(document).on('page:load', initialize);
  $(document).ready(initialize);

  function initialize(){
    //$('#wrap').hide();
    //$('#hunter').click(showSecondo);
    $('#recipe_wrap').on('click', '.close_recipe', close_recipe);
  }

  function close_recipe(){
    $('#recipe_wrap').fadeOut(500);
  }


})();
