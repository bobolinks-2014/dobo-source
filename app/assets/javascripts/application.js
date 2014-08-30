//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require turbolinks
//= require_tree .

$(document).ready(function() {
//search
 $("#search-bar").on("submit", function (event) {
   event.preventDefault();
   var query = $('#search-query').val();
   searchArticles(query);
  });

 $(".article-nice-button").on("click", function (event){
  buttonColor = $('.article-nice-button').css('background-color')
  if (buttonColor != "rgb(224, 224, 224)") {
    updateVoteCount();
  }
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

function updateVoteCount() {
  var request = $.ajax({
    url: "/article/:article_id/"
  });
}
