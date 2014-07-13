(function(){

  'use strict';

  $(document).on('page:load', initialize);
  $(document).ready(initialize);

  function initialize(){
    $('#risultati_ipad').hide();
    $('#risultati_ipad2').hide();
    $('#drop_boxes div').click(startPlanning);
    $('#risultati_ipad').on('click', '.fav_index_image.ipad', addRecipe);
    $('#risultati_ipad2').on('click', '.fav_index_image.ipad', addRecipe);

  }

  var day;
  var position;

  function startPlanning(){
    $('#drop_boxes div').css('border', '1px solid white');
    var x = $(this).text();
    $(this).css('border', '5px ridge #98bf21').text('now click on the Recipe you want to add');
    x = x.split(' ');
    console.log(x[4]);
    day = x[4].toString().toLowerCase();
    $('#form_day').val(day);
  }

  function addRecipe(){
    var x = $(this).find('img').attr('src');
    var y = $(this).next().text();
    console.log(x);
    console.log(y);
    $('#form_name').val(y);
    $('#form_image').val(x);
    $('#monday_ipad input.btn').css({
      'visibility' : 'visible',
      'position' : 'relative',
      'top' : '40px',
      'left' : ''+position()+''
    }).hide().fadeIn(500);
    displayRecipe(x, y);
  }

  function position(){
    var result;
    switch(day){
      case 'monday':
        result = '10px';
        break;
      case 'tuesday':
        result = '210px';
        break;
      case 'wednesday':
        result = '410px';
        break;
      case 'thursday':
        result = '610px';
        break;
      case 'friday':
        result = '810px';
        break;
      case 'saturday':
        result = '1010px';
        break;
      case 'sunday':
        result = '1210px';
        break;
    }
    return result;
  }

  function displayRecipe(img, text){
    console.log('display: '+img);
    console.log('display: '+text);
    var box;
    switch(day){
      case 'monday':
        box = '#drop_box_ipad'
        break;
      case 'tuesday':
        box = '#drop_box_tuesday_ipad'
        break;
      case 'wednesday':
        box = '#drop_box_wednesday_ipad'
        break;
      case 'thursday':
        box = '#drop_box_thursday_ipad'
        break;
      case 'friday':
        box = '#drop_box_friday_ipad'
        break;
      case 'saturday':
        box = '#drop_box_saturday_ipad'
        break;
      case 'sunday':
        box = '#drop_box_sunday_ipad'
        break;
    }
    $(box).text(day+' '+text).css('background', 'url('+img+')').css('text-transform', 'capitalize').css('background-size', 'cover');
  }

/*
  function scrollToAnchor(){
    $('#here').css('background', 'url(http://evernode.delacqua.us/img/johngmailcom/john/442395-1pq2h.jpg)').css('background-size', 'cover');
    $('#there *').remove();
    $('#search_form').hide();
    $('#create_new_recipe').hide();
    $('html,body').animate({scrollTop: $('#here').offset().top}, 800, function(){
      $('#search_form').fadeIn(500, function(){
        $('#search_rating').focus();
      });
    });
  }
*/

})();
