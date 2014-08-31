$(document).ready(function() {
  $('#new_comment').on('submit', function(event) {
    event.preventDefault();
    var comment = $(this).serialize();
    var id = $("#art-id").val();
    sendComment(comment, id);
  });
});

function sendComment(commentParams, id) {
  var sendRequest = $.ajax({
    url: "/articles/"+id+"/comments",
    type: "POST",
    data: commentParams
  });
  sendRequest.done(function(response){
    addComment(response); 
  });
  return sendRequest;
}

function getDate() {
  var d = new Date();

  var month = d.getMonth()+1;
  var day = d.getDate();

  var output = month + '/' + 
      (day<10 ? '0' : '') + day + '/' +
      d.getFullYear();

  return output;
}

function addComment(comment) {
  $('#new-comment').trigger("reset");
  $(".comment-session").prepend("<div class='comment'><input type='hidden' name='comment_id' value='"+comment.id+"'><div class='vote-message'><p> </p></div><button class='comment-nice-button btn btn-default btn-xs pull-right' type='submit'>niiiiiice</button><h3 class='comment-vote-count pull-right badge'>0</h3><p>"+comment.comment+"</p><div class='comment-details panel-body'><small>posted by: "+comment.commenter+" | created on: "+getDate()+"</small></div>")
}
