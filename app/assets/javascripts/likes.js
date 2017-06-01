// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var total_likes = [];
var i = 0;
for(i=1; i <= count; i++) {
  console.log('post count '+post_like_count);
  console.log(i)
  total_likes.push(post_like_count);
  document.getElementById('button_'+i).addEventListener("click", function() {
    document.getElementById('count_'+i).innerHTML = total_likes[i] + 1;
  });
};
