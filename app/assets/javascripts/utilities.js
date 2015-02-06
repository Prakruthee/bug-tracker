function validateName(element){
  var pattern = /^[A-Z][a-z]{3,19}$/
  var element_value = $(element).val();
  if(pattern.test(element_value)){
    $("#error_msg").html("Name you enterd is currect").css("color", "red").css("fontSize", "10px").hide();
   return true;
 }
 else{
  $("#error_msg").html("Fisrt letter should be capital and no special carracter are allowed..").css("color", "red").css("fontSize", "10px").show();
}
}

// function validateEmail(element){
//   var pattern = /^[A-Z][a-z]{3,19}$/
//   var element_value = $(element).val();
//   if(pattern.test(element_value)){
//     $("#error_msg2").html("Email is currect").css("color", "red").css("fontSize", "10px").hide();
//    return true;
//  }
//  else{
//   $("#error_msg2").html("Email formate is incurrect").css("color", "red").css("fontSize", "10px").show();
// }
// }

function validatePassword(element){
  var pattern = /[0-9]{6,19}$/;
  if(pattern.test(element_value)){
    $("#error_msg3").html("Password is currect").css("color", "red").css("fontSize", "10px").hide();
   return true;
 }
 else{
  $("#error_msg3").html("Password should have atleast 6 character").css("color", "red").css("fontSize", "10px").show();
}
}

function validateConfirmPassword(element){
  var password = $("#inputPassword").val();
  var confirmpassword = $("#confrimPassword").val();
  if(password===confirmpassword){
    $("#error_msg4").html("Password macthes").css("color", "blue").css("fontSize", "10px").show();
   return true;
 }
 else{
  $("#error_msg4").html("Password dosen't match").css("color", "red").css("fontSize", "10px").show();
}
}