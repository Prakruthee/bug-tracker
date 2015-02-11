function session_validator() {

  $('#sign_in').validate({
    debug: true,
    rules: {
     "email": {
       required: true,
       email: true,
       remote:"/sessions/check_email"
     },
     "password" : {
      required: true,
      minlength: 6
    }
  },


  errorElement: "span",
  errorClass: "help-block",

  messages: {

    "email": {
      required: "This field is required",
      email: "Please enter a valid E-Mail address!",
      remote: "User doesn't exists"
    },

    "password": {
      required:"This field is required",
      minlength:"Enter minimum 6 characters!"

    },

  },

  highlight: function(element) {
   $(element).parent().parent().addClass("has-error");
 },

 unhighlight: function(element) {
  $(element).parent().parent().removeClass("has-error");
},

invalidHandler: function(event, validator) {
        // 'this' refers to the form
        var errors = validator.numberOfInvalids();
        if (errors) {

          // Populating error message
          var errorMessage = errors == 1
          ? 'You missed 1 field. It has been highlighted'
          : 'You missed ' + errors + ' fields. They have been highlighted';

          // Removing the form error if it already exists
          $("#div_user_js_validation_error").remove();

          errorHtml = "<div id='div_user_js_validation_error' class=\"alert alert-danger\" data-alert=\"alert\" style=\"margin-bottom:5px;\">"+ errorMessage +"</div>"
          //$("#div_user_details").prepend(errorHtml);
          $("#div_modal_generic div.modal-body-main").prepend(errorHtml);

          // Show error labels
          $("div.error").show();

        } else {
          // Hide error labels
          $("div.error").hide();
          // Removing the error message
          $("#div_user_js_validation_error").remove();
        }

      },
      submitHandler: function(form) {

       form.submit();
     }
   });

}
