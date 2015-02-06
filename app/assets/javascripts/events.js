$(document).on('focusout', '.js-user-name', function(){
  validateName($(this));
});

// $(document).on('focusout', '.js-email', function(){
//   validateEmail($(this));
// });

$(document).on('focusout', '.js-password', function(){
  validatePassword($(this));
});

$(document).on('focusout', '.js-confirm-password', function(){
  validateConfirmPassword($(this));
});
