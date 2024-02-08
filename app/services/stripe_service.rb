# app/services/stripe_service.rb
class StripeService
    def self.create_product(program)
      begin
        Stripe.api_key = ENV['STRIPE_PRIVATE_KEY']
  
        # Create a product in the local database
        product = Product.create(name: program.name, price: program.price, program_id: program.id)
  
        # Use the Stripe gem to create a product in Stripe
        stripe_product = Stripe::Product.create({
          name: program.name,
          type: 'service',
          description: program.description
        })
  
        # Create a price for the product
        stripe_price = Stripe::Price.create({
          product: stripe_product.id,
          unit_amount: (program.price * 100).to_i, # Stripe uses cents, so multiply by 100
          currency: 'usd',
          recurring: program.recurring? ? { interval: 'month' } : nil
        })
  
        # Update the local product with Stripe information
        product.update(stripe_product_id: stripe_product.id, stripe_price_id: stripe_price.id)
        Rails.logger.info("Product created in Stripe successfully.")
      rescue StandardError => e
        Rails.logger.error("Error creating product in Stripe: #{e.message}")
        product.destroy if product.persisted? # Rollback the creation in the local database if Stripe creation fails
      end
    end
  end
  