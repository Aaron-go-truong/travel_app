import $ from "jquery";

$(() => {
  var items = [
    "C++",
    "Java",
    "Python",
    "C#",
    "DSA",
    "STL",
    "Self Placed",
    "Android",
    "Kotlin",
    "GeeksforGeeks",
    "GFG",
  ];
  // jQuery inbuild function
  $("#tags").autocomplete({
    source: items, // list of items.
  });
});
