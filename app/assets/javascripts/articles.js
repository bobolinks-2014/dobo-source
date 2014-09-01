$(document).ready(function() {

	editURL = /articles\/\d*\/edit/;
	
	if (editURL.test(window.location.pathname)) {
  	var tagList = $("#article_tag_list").val().split(", ");
  	var phaseTagList = ["phase0", "phase1", "phase2", "phase3", "alumni"];
  	var newTags = [];
  	
		for (var i = 0; i < tagList.length; i++){
			if (phaseTagList.indexOf(tagList[i]) == -1 ) {
				newTags.push(tagList[i]);
			};
		};


		$("#article_tag_list").val(newTags.join(", "));
	};

	newURL = "/articles/new"
	if (newURL === window.location.pathname) {

		event.preventDefault();
	
		$('textarea').change(function(){
			if ($('textarea').val() != ""){
				$('#article_url').hide();
				$('label[for*="article_url"]').hide();
			}
			else if ($('textarea').val() == "") {
				$('#article_url').show();
				$('label[for*="article_url"]').show();
			}
		});
		
		$('input#article_url').change(function(){		
			if ($('input#article_url').val() != "") {
				$("textarea").hide();
				$('label[for*="article_body"]').hide();
			}
			else if ($('input#article_url').val() == "") {
				$("textarea").show();
				$('label[for*="article_body"]').show();
			}
		});

	};


});
