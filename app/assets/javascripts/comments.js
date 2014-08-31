$(document).ready(function() {
  $('#new_comment').on('submit', function(event) {
    event.preventDefault();
    var comment = $(this).serialize();
    var id = $("#art-id").val();
    sendComment(comment, id);
  });
});

