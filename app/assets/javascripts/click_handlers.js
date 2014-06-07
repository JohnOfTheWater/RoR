(function(){

  'use strict';

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
