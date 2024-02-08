class ProgramsController < ApplicationController

    before_action :set_program, only: [:show, :edit, :update, :destroy, :signup,:create_checkout_session]
   

    def index
      @programs = Program.all
    end

    def show

    end

    def new
        @program = Program.new
    end

    def create
        @program = Program.new(program_params)

    if @program.save
        redirect_to @program, notice: 'Program was successfully created.'
      else
        render :new
      end
    end



    def edit
    end

    def update
      if @program.update(program_params)
        redirect_to @program, notice: 'Program was successfully updated.'
      else
        render :edit
      end
    end

    def signup
      flash[:notice] = 'Signed up for the program!'
      redirect_to @program
    end

    def destroy
        @program.destroy
        redirect_to programs_url, notice: 'Program was successfully destroyed.'
    end


    def create_checkout_session
      session = Stripe::Checkout::Session.create({
      line_items: [
        {
        price: 'price_1OdLxGGFI1uaMnOfvgWU6leH',
        quantity: 1,
       }
      ],
      mode:'subscription',
      success_url: checkout_success_url(@program),
      cancel_url: program_url(@program)

      })
      redirect_to session.url, allow_other_host: true, status: 303
    end



    private

    def set_program
      @program = Program.find(params[:id])
      session[:program_id] = @program.id
    rescue ActiveRecord::RecordNotFound
      # Handle the case where the program is not found
      redirect_to programs_path, alert: 'Program not found'
    end


    def program_params
      params.require(:program).permit(:name, :description, :program_type, :age_group, :date)
    end

    #creating  product

    def create_product
      # Create a product in the local database
      product = Product.create(name: self.name, price: self.price, program_id: self.id)

      # Create the same product in Stripe
      create_product_in_stripe(product)
    end

    def create_product_in_stripe(product)
      begin
        Stripe.api_key = ENV['STRIPE_PRIVATE_KEY']

        # Use the Stripe gem to create a product in Stripe
        stripe_product = Stripe::Product.create({
          name: product.name,
          type: 'service',
          description: self.description
        })

        # Create a price for the product
        stripe_price = Stripe::Price.create({
          product: stripe_product.id,
          unit_amount: (product.price * 100).to_i, # Stripe uses cents, so multiply by 100
          currency: 'usd',
          recurring: self.recurring? ? { interval: 'month' } : nil
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