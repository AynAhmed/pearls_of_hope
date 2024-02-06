class CartProductsController < ApplicationController

    def index
        # Assuming you have a method to retrieve the current user's cart
        @user_cart = current_user.cart

        if @user_cart.present?
          @cart_products = @user_cart.cart_products
        else
          @cart_products = [] # Initialize an empty array or handle the absence of a cart as needed
        end
      end

        def new
            @cart_product = CartProduct.new
          end


        def create
          # Find the product and student based on the form submission
          product = Product.find(params[:cart_product][:product_id])
          student = Student.find(params[:cart_product][:student_id])

          # Find or create the user's cart
          user_cart = current_user.cart || current_user.create_cart

          # Create a new CartProduct record associating the product, student, and cart
          cart_product = user_cart.cart_products.build(
            product: product,
            student: student
          )

          if cart_product.save
            flash[:notice] = "Product added to cart successfully!"
          else
            flash[:alert] = "Error adding product to cart."
          end

          redirect_to carts_path, status: :see_other
        end
      end




def destroy

end


