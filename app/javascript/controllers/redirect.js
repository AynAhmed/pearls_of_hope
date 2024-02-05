document.addEventListener("DOMContentLoaded", function() {
    const submitButton = document.getElementById("student-submit-button");
    if (submitButton) {
      submitButton.addEventListener("click", function(event) {
        event.preventDefault(); // Prevent the default form submission behavior
        
        // Perform any form validation if needed
        
        // Redirect to the new enrollment path with the desired parameters
        window.location.href = "<%= new_enrollment_path(program_id: @program.id, existing_student: true) %>";
      });
    }
  });