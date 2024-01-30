class CheckoutController < ApplicationController
    before_action :authenticate_user!
    def show
    
        @program = Program.find_by(id: params[:id])

        if @program.nil?
          redirect_to root_path, alert: 'Program not found'
          return
        end

        current_user.set_payment_processor :stripe
      current_user.payment_processor.customer


      @checkout_session = current_user.payment_processor.checkout(
              mode:'subscription',
              line_items: [{
                  price: @program.stripe_price_id,
                  quantity: 1
              }],
              success_url: checkout_success_url
      )
  end
    def success
    end

    def index
        @programs = Program.all
        @cart = current_user.carts || current_user.create_cart
      end
    
      def update_cart
        program = Program.find(params[:program_id])
        quantity = params[:quantity].to_i


        cart= current_user.carts || current_user.create_cart
    
        current_user.carts.add_program(program, quantity)
    
        redirect_to checkout_index_path, notice: 'Program added to cart!'
      end
    
      def show_cart
        @cart = current_user.cart || current_user.create_cart
        # Additional logic to display the cart contents
      end
end