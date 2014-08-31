//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require_tree .

$(document).ready(function() {
//search
  $("#search-bar").on("submit", function (event) {
    //event.preventDefault();
    var query = $('#search-query').val();
    searchArticles(query);
  });

 //just for articles on main page
 $(".article-nice-button").on("click", function (event){
  event.preventDefault();
  articleUrl = /articles\/\d/.exec($(this).parent().children('a').attr('href'))
  updateVoteCount(articleUrl);
 });

});

function searchArticles(query) {
  $('.alert').remove(); 
  var request = $.ajax({
    url: "/search/"+query,
    type: "GET",
    dataType: "JSON"
  });
  request.fail(function(status) {
     notFound(query);
  });
  request.done(function(response){
      addFoundArticles(response, query); 
  });
  return request;
}

function addFoundArticles(articles, query) {
  $('#search-bar').trigger("reset");
  $('.main').prepend("<div class='alert alert-success' role='alert'>Showing results for <strong>"+ query+"</stron></div>"); 
  //TODO: add angular to populate results
}

function notFound(query) {
  $('#search-bar').trigger("reset");
  $('.main').prepend("<div class='alert alert-danger' role='alert'>Sorry, no results for <strong>"+ query+"</stron></div>"); 
}

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

function addComment(comment) {
  $(".comment-session").prepend("<p>"+comment.commenter+"</p><p>"+comment.comment+"</p>")
}

function updateVoteCount(articleUrl) {
var vote = {
  tally_id: parseInt(/\d/.exec(articleUrl)[0]),
  tally_type: "Article"
};

var request = $.ajax({
  url: articleUrl + "/votes",
  type: "POST",
  data: {vote: vote},
  dataType: "JSON"
});

request.done(function(response){
  vote = response.vote
  message = response.message
  if (response.voted === 1) {
    search = "[href*='articles/" + vote.tally_id+ "']";
    $("a"+search).parent().children('button').remove();
    var currentVoteCount = parseInt($("a"+search).parent().children('h3').text());
    $("a"+search).parent().children('h3').text(currentVoteCount + 1);
    $("a"+search).next().children('p').text(message);
  }
  else if (response.voted === 0) {
    search = "[href*='articles/" + vote.tally_id+ "']";
    $("a"+search).parent().children('button').remove();
    var currentVoteCount = parseInt($("a"+search).parent().children('h3').text());
    $("a"+search).parent().children('h3').text(currentVoteCount);
    $("a"+search).next().children('p').text(message);
  }
});

}
