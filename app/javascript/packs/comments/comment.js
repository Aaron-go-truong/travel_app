import $ from "jquery";

$(() => {
  let input_cmt = $("#input-cmt");
  input_cmt.on("click", () => {
    input_cmt.attr("cols", 20);
    input_cmt.attr("rows", 3);
    input_cmt.css("border-radius","0.75rem");
  });
});
