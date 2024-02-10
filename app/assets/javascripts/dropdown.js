// dropdown.js

// Function to append profile avatar dropdown to navbar dropdown container
function appendProfileDropdown() {
    var profileDropdown = $('.profile-dropdown');
    $('.navbar-flex-container').append(profileDropdown);
  }
  
  // Function to move profile avatar dropdown back to its original position
  function moveProfileDropdown() {
    var profileDropdown = $('.profile-dropdown');
    $('.navbar').append(profileDropdown);
  }
  
  // Toggle navbar dropdown
  $('.nav-toggle').click(function() {
    if ($(this).is(':checked')) {
      appendProfileDropdown();
    } else {
      moveProfileDropdown();
    }
  });
  
  // Event listener for toggling profile avatar dropdown
  $(document).on('click', '.profileAvatar', function(event) {
    event.preventDefault(); // Prevent the default link behavior
    event.stopPropagation(); // Stop event propagation to prevent dropdown from closing immediately
    $('.profile-dropdown .dropdown-content').toggle();
  });
  
  // Close dropdown when clicking outside
  $(document).on('click', function(event) {
    if (!$(event.target).closest('.profile-dropdown').length) {
      $('.profile-dropdown .dropdown-content').hide();
    }
  });
  