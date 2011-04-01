// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//
$(document).ready(function() {

    $(".remote-toggle").click(function() {
      myid = $(this).attr("id");
      myid = myid + "-container";
      target = $("#" +myid);

      if (target.html() == "") {

        console.log("bla");
        target.html("<img src='/images/spinner.gif'/>");
        $.get( $(this).attr("href"), function(data) {
          target.html(data);

          });
      } else {
        target.toggle();
      }
      return false;
    });

    $('a[rel*=facebox]').facebox();

});
