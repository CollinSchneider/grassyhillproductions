// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  $('select').material_select();

  $('.next').click(function(){
    $(this).attr('class', 'next hidden')
    var cardDiv = $(this).parent().parent().parent().parent().parent();
    cardDiv.find('.previous').attr('class', 'previous')
    cardDiv.find('.front-image').attr('class', 'hidden responsive-img front-image')
    cardDiv.find('.inside-image').attr('class', 'responsive-img inside-image')
  })

  $('.previous').click(function(){
    $(this).attr('class', 'previous hidden')
    var cardDiv = $(this).parent().parent().parent().parent().parent();
    cardDiv.find('.next').attr('class', 'next')
    cardDiv.find('.inside-image').attr('class', 'hidden responsive-img inside-image')
    cardDiv.find('.front-image').attr('class', 'responsive-img front-image')
  })
})
