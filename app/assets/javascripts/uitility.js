setTimeout(function(){  $(".event-panels:eq(0)").addClass("active"); }, 400);
setTimeout(function(){  $(".event-panels").click(function(){
  $(".active").removeClass("active");
  $(this).addClass("active");
}); }, 400);

setTimeout(function(){
    $('#flash').remove();
  }, 5000);
