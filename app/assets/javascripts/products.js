$(function(){
  $(".product-modal").hide();
  $(".product").click(function(){
    $(this).find(".product-modal:first").addClass("animated bounceInRight").show();
  });
});