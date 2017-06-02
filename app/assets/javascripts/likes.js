function ready(fn) {
  if (document.readyState != 'loading'){
    fn();
  } else {
    document.addEventListener('DOMContentLoaded', fn);
  }
}

function likeCount(post_id, likes) {
  document.getElementById('count_' + post_id).innerHTML = likes + 1;
};

ready(function() {
  document.querySelectorAll('.like-button').forEach(function(element) {
    element.addEventListener('click', function(evt) {
      var postId = evt.target.dataset.postId;
      var countElement = document.getElementById("count_" + postId);
      countElement.innerText = parseInt(countElement.innerText) + 1;
      evt.preventDefault();
    });
  });
});
