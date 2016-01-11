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

});
