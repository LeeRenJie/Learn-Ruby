// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import '@doabit/semantic-ui-sass'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

window.scrollBottom = function(id) {
  const element = $(`#${id}`)
  if (element.length > 0){
    const scrollHeight = element[0].scrollHeight;
    element.scrollTop(scrollHeight);
  }
};

function clearInput() {
  const input = $('#messages_body')
  input.keydown(function(e) {
    if (e.keyCode == 13) {
      (this).form.submit()
      e.preventDefault()
      e.target.value = "";
    };
  });
};

$(document).on('turbolinks:load', function() {
  $('.ui.dropdown').dropdown();
  $('.message').click(function() {
    $(this).transition('fade');
  });
  scrollBottom('messages');
  clearInput();
});
