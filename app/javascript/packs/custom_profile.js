import $ from 'jquery'

document.addEventListener('DOMContentLoaded', () => {
  $('#avatar_preview').on('click', () => {
    $('#avatar_file_field').trigger("click");
  });

  $("#avatar_file_field").on("change", function (e) {
    var files = e.target.files;
    var d = new $.Deferred().resolve();
    $.each(files, function (i, file) {
      d = d.then(function () {
        return previewImage(file);
      });
    });
  });

  var previewImage = function (imageFile) {
    var reader = new FileReader();
    var img = new Image();
    var def = $.Deferred();
    reader.onload = function (e) {
      $("#avatar_preview").empty();
      $("#avatar_preview").append(img);
      img.src = e.target.result;
      def.resolve(img);
    };
    reader.readAsDataURL(imageFile);
    return def.promise();
  };

  $('#background_preview').on('click', () => {
    $('#background_file_field').trigger("click");
  });

  $("#background_file_field").on("change", function (e) {
    var files = e.target.files;
    var d = new $.Deferred().resolve();
    $.each(files, function (i, file) {
      d = d.then(function () {
        return previewImage(file);
      });
    });
  });

  var previewImage = function (imageFile) {
    var reader = new FileReader();
    var img = new Image();
    var def = $.Deferred();
    reader.onload = function (e) {
      $("#background_preview").empty();
      $("#background_preview").append(img);
      img.src = e.target.result;
      def.resolve(img);
    };
    reader.readAsDataURL(imageFile);
    return def.promise();
  };
});
