function ready(fn) {
  if (document.readyState != 'loading'){
    fn();
  } else {
    document.addEventListener('DOMContentLoaded', fn);
  }
}

ready(function() {
  document.getElementById("user_avatar").onchange = function () {
    document.getElementById("upload_file").value = this.files[0].name;
  };
});
