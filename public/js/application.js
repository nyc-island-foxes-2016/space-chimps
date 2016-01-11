$(document).ready(function() {

  $("#post-questions").on("submit", function(event) {
    event.preventDefault();
    $.ajax({
      type: "POST",
      url: "/questions",
      data: $(this).serialize()
    }).done(function(response) {
      $('#post-questions').trigger("reset");
      $('#questions-section').append(response);
    });
  });

  $("#questions-section").on("submit", ".delete-question", function(event) {
    event.preventDefault();
    var question_id = getIdFromUrl(this.action)
    debugger
    $.ajax({
      type: "DELETE",
      url: "/questions/" + question_id,
      data: $(this).serialize()
    }).done(function(response) {
      console.log(response)
      debugger
      $('#questions-section').load(response);
    });
  });


});


function getIdFromUrl(urlString) {
  var idArray = urlString.slice(-4).split("");
  var sliceIndex = idArray.findIndex(function(el) {if (el == "/") {return true}; });
  var id = idArray.slice(sliceIndex +1).join("");
  return id;
}
