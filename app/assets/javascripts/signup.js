function SignUpValidator() {

  jQuery.validator.addMethod("pswd_match",function (value,element){
    return $("#user_password").val() == $('#user_password_confirmation').val();
  });

  jQuery.validator.addMethod("alpha", function(value, element) {
    return this.optional(element) || value == value.match(/^[a-zA-Z ]+$/);
  });

  jQuery.validator.addMethod("usr_format", function(value, element) {
    return this.optional(element) || value == value.match(/^[0-9\_\.]*[a-zA-Z]+[0-9\_\.]*$/);
  });

  $('#register').validate({
    debug: true,
    rules: {
      "user[name]": {
        required: true,
        alpha: true
      },
      "user[username]": {
        required: true,
        minlength: 6,
        maxlength: 256,
        usr_format: true,
        remote:"users/check_username"
      },
      "user[email]": {
       required: true,
       email: true,
       remote:"users/check_email"
      },
      "user[password]" : {
      required: true,
      minlength: 6
      },
      "user[password_confirmation]": {
      required: true,
      pswd_match: true
      }
    },

  errorElement: "span",

  errorClass: "help-block",
  messages: {
   "user[name]": {
    required: "This field is required",
    alpha: "Should contain only alphabets!"
  },
  "user[username]": {
    required: "This field is required",
    usr_format: "Should contain only alphabets, numbers and special characters(. and _ )",
    remote: "Username has already been taken"
  },
  "user[email]": {
    required: "This field is required",
    email: "Please enter a valid E-Mail address!",
    remote: "Email has already been taken"
  },
  "user[password]": {
    required:"This field is required",
    minlength:"Enter minimum 6 characters!",
    maxlength: "Exceeded length!"
  },
  "user[password_confirmation]": {
    required: "This field is required",
    pswd_match: "Password does not match"
  }
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

  setTimeout(function(){ $("#exampleInputFile").change(function(){
    if (this.files && this.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#preview').attr('src', e.target.result);
      }
        reader.readAsDataURL(this.files[0]);
      }
  }); }, 400);
}


