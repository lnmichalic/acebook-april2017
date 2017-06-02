function ready(fn) {
  if (document.readyState != 'loading'){
    fn();
  } else {
    document.addEventListener('DOMContentLoaded', fn);
  }
}

ready(function() {
  document.querySelectorAll('.like-button').forEach(function(element) {
    element.addEventListener('click', function(evt) {
      var postId = evt.target.dataset.postId;
      var countElement = document.getElementById("count_" + postId);
      countElement.innerText = parseInt(countElement.innerText) + 1;
    });
  });
});
