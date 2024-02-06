// Handle Add to Cart button click
$(document).on('ajax:success', 'a[data-method="post"]', function(event) {
  // Handle success, e.g., update the cart summary
  // You can also add animations or other user feedback here
}).on('ajax:error', 'a[data-method="post"]', function(event) {
  // Handle error, e.g., display an error message
});

