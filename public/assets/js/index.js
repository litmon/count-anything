$(function(){
  $('#image').on('change', function(e){
    var file = $(this).prop('files')[0],
    reader = new FileReader(),
    preview = $('#preview');

    if(file.type.match('image.*')){
      reader.onload = function() {
        preview.attr('src', reader.result);
      }
      reader.readAsDataURL(file);
    }
  });
});
