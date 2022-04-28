let show_error, submitHandler;

show_error = function (message) {
  console.log(message);
  if(!$("#flash-messages").length){
    $('#main').prepend("<div id='flash-messages'></div>");
  }

  $("#flash-messages").html('<div class="alert alert-warning"><a class="close" data-dismiss="alert">×</a><div id="flash_alert">' + message + '</div></div>');
  $('.alert').delay(5000).fadeOut(3000);

  return false;
};

function stripeTokenHandler(token, form){
  form.append($("<input type=\"hidden\" name=\"payment[token]\" />").val(token.id));
  form.get(0).submit();
};

function createToken(form){
  stripe.createToken(card).then(function(result) {
    if(result.error){
      show_error(result.error.message);
      form.find("input[type=submit]").prop("disabled", false);
    } else {
      stripeTokenHandler(result.token, form);
    }
  });
};

submitHandler = function(event){
  event.preventDefault();

  var $form = $(event.target);
  $form.find("input[type=submit]").prop("disabled", true);

  //If Stripe was initialized correctly this will create a token using the credit card info
  if(stripe){
    createToken($form);
  }else{
    show_error("Failed to load credit card processing functionality. Please reload this page in your browser.");
  }
};

$(document).on('ready turbolinks:load', function(){
  $(".cc_form").on("submit", submitHandler);

  if(typeof card !== 'undefined'){
    card.addEventListener('change', function(event) {
      var displayError = document.getElementById('card-errors');
      if (event.error) {
        displayError.textContent = event.error.message;
      } else {
        displayError.textContent = '';
      }
    });
  }
});
