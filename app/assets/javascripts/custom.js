$(document).ready(function() {
  $('.autohide').delay(5000).slideUp('slow');
});

function notify(type, text) { // eslint-disable-line
  if (typeof(PNotify) === 'undefined') {
    return;
  }
  new PNotify({
    type: type,
    text: text,
    nonblock: {
      nonblock: true
    },
    styling: 'bootstrap3',
    hide: true
  });
}

function init_datetimepicker() {
  $('.datepicker').datetimepicker({
    format: 'DD/MM/YYYY'
  });
  $('.timepicker').datetimepicker({
    format: 'HH:mm'
  });
  $('.datetimepicker').datetimepicker({
    format: 'DD/MM/YYYY HH:mm'
  });
}

$(document).ready(function() {
  init_datetimepicker();
});
