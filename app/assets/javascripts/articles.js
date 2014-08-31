$(document).ready(function() {
  	var tagList = $("#article_tag_list").val().split(", ");
  	var phaseTagList = ["phase0", "phase1", "phase2", "phase3", "alumni"];
  	var newTags = [];
  	
		for (var i = 0; i < tagList.length; i++){
			if (phaseTagList.indexOf(tagList[i]) == -1 ) {
				newTags.push(tagList[i]);
			};
		};


		$("#article_tag_list").val(newTags.join(", "));
});