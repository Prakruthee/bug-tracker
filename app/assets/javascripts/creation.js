function UserValidator() {


  $('#creation').validate({
    debug: true,
    rules: {
      "issue[issue_name]": {
        required: true,
        maxlength: 30
      },
      "issue[issue_type]": {
        required: true
      },
      "issue[description]": {
       required: true
      },
    },

    errorElement: "span",
    errorClass: "help-block",

    messages: {
     "issue[issue_name]": {
      required: "This field can't be blank",
      maxlength: "Limit exceeded"
    },

    "issue[issue_type]": {
      required: "Please select a value"
    },

    "issue[description]": {
      required: "This field can't be blank"
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
