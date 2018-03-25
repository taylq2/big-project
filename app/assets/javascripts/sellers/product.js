$(function () {
  $('#datetimepicker1').on('dp.change', function (e) {
    $('#datetimepicker2').data('DateTimePicker').minDate(e.date);
  });
  $('datetimepicker2').on('dp.change', function (e) {
    $('#datetimepicker1').data('DateTimePicker').maxDate(e.date);
  });

  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#imagePreview').css('background-image', 'url(' + e.target.result + ')');
        $('#imagePreview').hide();
        $('#imagePreview').fadeIn(650);
      };
      reader.readAsDataURL(input.files[0]);
    }
  }
  $('#imageUpload').change(function () {
    readURL(this);
  });
});
