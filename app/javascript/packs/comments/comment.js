import $ from "jquery";

$(() => {
  let input_cmt = $("#input-cmt");


  $("#edit-cmt").hide();

  input_cmt.on("click", () => {
    input_cmt.attr("cols", 20);
    input_cmt.attr("rows", 3);
    input_cmt.css("border-radius", "0.75rem");
  });

  $(".row").hover(
    () => {
      $("#options").removeClass("d-none");
    },
    () => {
      $("#options").addClass("d-none");
    }
  );

  $(".more-options").hover(
    () => {
      $(this).css("background-color", "#e5e7e9");
    },
    () => {
      $(this).css("background-color", "");
    }
  );

  $("#edit-cmt-btn").on("click", () => {
    $("#cmt").addClass("d-none");
    $("#edit-cmt").show();
  });


});
