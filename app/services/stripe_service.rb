# app/services/stripe_service.rb

module StripeService
    def self.create_stripe_product(name, price)
      begin
        # Set your Stripe API key here
        Stripe.api_key = ENV['STRIPE_PRIVATE_KEY']
  
        # Check if the product already exists in Stripe
        existing_product = Stripe::Product.list(name: name, limit: 1).data.first
  
        if existing_product
          puts "Product '#{name}' already exists in Stripe (ID: #{existing_product.id})."
          return existing_product.id, nil
        end
  
        # Create a Stripe product
        product = Stripe::Product.create(
          name: name,
          type: 'service' # Assuming you're creating a service-type product
        )
  
        # Create a price for the product
        stripe_price = Stripe::Price.create(
          product: product.id,
          unit_amount: price * 100, # Stripe expects the price in cents
          currency: 'usd' # Change it according to your currency
        )
  
        # Return the product and price IDs
        puts "Stripe product '#{name}' created successfully (Product ID: #{product.id}, Price ID: #{stripe_price.id})."
        return product.id, stripe_price.id
      rescue Stripe::StripeError => e
        # Handle Stripe errors
        puts "Stripe error: #{e.message}"
        return nil, nil
      rescue => e
        # Handle other errors
        puts "Error: #{e.message}"
        return nil, nil
      end
    end
  end
  