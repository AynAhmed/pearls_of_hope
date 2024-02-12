console.log("checkout.js loaded!");

document.addEventListener('DOMContentLoaded', function () {

  // Initializing Stripe with your public API key
  console.log("checkout.js loaded!");
  const public_key = gon.env_variables.STRIPE_PUBLIC_KEY;
  const stripe = Stripe(public_key);

  console.log("Stripe object:", stripe);


  // Creating an instance of the Stripe Elements library
  const elements = stripe.elements();

  // Creating a card element and mounting it to the specified HTML element
  const cardElement = elements.create('card');
  cardElement.mount('#card-element');

  // Selecting the form
  const form = document.getElementById('checkout-form');

  // Handling form submission
  form.addEventListener('submit', async function (event) {
    event.preventDefault();

    // Creating a token for the card using Stripe
    const { token, error } = await stripe.createToken(cardElement);

    // Checking for errors during token creation
    if (error) {
      console.error(error);
    } else {
      // If no errors, create a hidden input with the token information
      const hiddenInput = document.createElement('input');
      hiddenInput.type = 'hidden';
      hiddenInput.name = 'stripe_token';
      hiddenInput.value = token.id;

      // Appending the hidden input to the form
      form.appendChild(hiddenInput);

      // Submitting the form
      form.submit();
    }
  });
});