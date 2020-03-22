const inputKlass = '.js-input-url';
const submitKlass = '.js-submit-url';

const notifications = '.alert';
const resultLink = '.js-result-link';
const resultBlock = '.js-result-block';
const resultError = '.js-result-error';

function requestShortUrl() {
  hideNotification();
  $.post("/", {url: $(inputKlass).val()})
    .done(function(data){ displayResults(data); })
    .fail(function(data){ showError(); });
}

function hideNotification(argument) {
  $(notifications).hide();
}

function showError() {
  $(resultError).show();
}

function displayResults(data) {
  let link = $(resultLink);
  link.attr('href', data.short_url);
  link.text(data.short_url);
  $(resultBlock).fadeIn();
}

$(document).ready(function(){

  $(submitKlass).click(function(e){
    e.preventDefault()
    requestShortUrl()
  });

  $(inputKlass).keypress(function(e){
    let keycode = (e.keyCode ? e.keyCode : e.which);
    if (keycode == 13) {
      requestShortUrl();
    };

    e.stopPropagation();
  });

  $('[data-dismiss="alert"]').click(function(e){
    hideNotification();
  });
});
