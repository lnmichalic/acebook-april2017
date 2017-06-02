// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function like_count(post_id, likes) {
  document.getElementById('count_' + post_id).innerHTML = likes + 1;
};
