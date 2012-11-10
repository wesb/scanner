// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery

$(function(){
  $(".product-modal").hide();
  $("a.product").on('click', function(e){
    $("#product-" + $(this).data("product")).addClass("animated bounceInRight").show();
    e.preventDefault();
  });
  $(".product-modal-close").on('click', function(e){
    $(this).parents(".product-modal:first").addClass("bounceOutLeft");
    setTimeout(function(){
      $(".product-modal").hide().removeClass("bounceOutLeft bounceInRight");
    }, 1000);
    e.preventDefault();
  });
});
