//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require_tree .

$(document).ready(function() {
//search
  $("#search-bar").on("submit", function (event) {
    event.preventDefault();
    var query = $('#search-query').val();
    searchArticles(query);
  });

 //just for articles on main page
 $(".article-nice-button").on("click", function (event){
  event.preventDefault();
  articleUrl = /articles\/\d+/.exec($(this).parent().children('a').attr('href'))
  updateArticleVoteCount(articleUrl);
 });

 //upvoting comments on a specific article page
 $(".comment-session").on("click", '.comment-nice-button', function (event){
  commentID = parseInt($(this).parent().children('input').val());
  articleUrl = window.location.pathname;
  updateCommentVoteCount(articleUrl, commentID);
 });

 $('.side-bar-tag').on('click', function (event) {
  var query = $(this).children().first().text();
  var tempPhase = $(this).parent().attr('id');
  var newStr = tempPhase.replace(/-/g, "");
  var querySend = newStr+","+query;
  searchArticles(querySend);             
 });

 $('.article-tag-search').on('click', function (event) {
  searchArticles($(this).children().first().text());             
 });

 $('.comment-session').on('click', '.comment-delete-button', function(event) {
  var commentId = $(this).parent().find("input[name='comment_id']").val(); 
  deleteComment(commentId, $(this).parent());
 });

});

function searchArticles(query) {
  $('.alert').remove(); 
  var request = $.ajax({
    url: "/search",
    type: "GET",
    data: {query: query},
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
  parsed_html = jQuery.parseHTML(articles.html)
  main_div = $('.col-sm-9.col-sm-offset-0.col-md-10.col-md-offset-0.main')
  main_div.empty()
  main_div.append(parsed_html);
  $('.main').prepend("<h4 class='page-header alert alert-success' role='alert'>Showing results for <strong>"+ query +"</strong></h4>"); 
}

function notFound(query) {
  $('#search-bar').trigger("reset");
  $('.main').prepend("<div class='alert alert-danger' role='alert'>Sorry, no results for <strong>"+ query+"</stron></div>"); 
}

function updateArticleVoteCount(articleUrl) {
  var vote = {
    tally_id: parseInt(/\d+/.exec(articleUrl)),
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
      $("a"+search).next().children('p').text(message);
    }
  });
}

function updateCommentVoteCount(articleUrl, commentID) {
  var articleID = parseInt(/\d+/.exec(articleUrl));
  var path = articleUrl + "/"+ commentID + "/votes";
  var vote = {
    article_id: articleID,
    tally_id: commentID,
    tally_type: "Comment"
  };

  var request = $.ajax({
    url: path,
    type: "POST",
    data: {vote: vote},
    dataType: "JSON"
  });

  request.done(function(response){
    vote = response.vote
    message = response.message
    if (response.voted === 1) {
      search = $(".comment input[value~="+ vote.tally_id +"]");
      search.parent().children('button').remove();
      var currentVoteCount = parseInt(search.parent().children('h3').text());
      search.parent().children('h3').text(currentVoteCount + 1);
      search.parent().children('.vote-message').children('p').text(message)
    }
    else if (response.voted === 0) {
      search = $(".comment input[value~="+ vote.tally_id +"]");
      search.parent().children('button').remove();
      var currentVoteCount = parseInt(search.parent().children('h3').text());
      search.parent().children('.vote-message').children('p').text(message)
    }
  });

}
