class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_gon_variables

  def show
    @render_cart = true
  end


  def add
    @product = Product.find_by(id: params[:id])
    current_cart_product = @cart.cart_products.find_by(product_id: @product.id)
    # If the product already exists in the cart, do nothing
    flash[:notice] = "Product is already in the cart."
  else
    # Created a new CartProduct for the product
    @cart.cart_products.create(product: @product)
    flash[:notice] = "Product added to cart successfully."
  end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace('cart',
                                                   partial: 'carts/cart',
                                                   locals: { cart: @cart }),
                              turbo_stream.replace(@product)]
      end
    end
  end


  def remove
    CartProduct.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart',
                                                  partial: 'carts/cart',
                                                  locals: { cart: @cart })
      end
    end

    def set_gon_variables
      gon.env_variables = {
          STRIPE_PUBLIC_KEY: ENV['STRIPE_PUBLIC_KEY'],
          STRIPE_SECRET_KEY: ENV['STRIPE_SECRET_KEY']
      }
    end

  end
























def add_to_cart
  # Retrieve the selected product and student
  product = Product.find(params[:product_id])
  student = Student.find(params[:student_id])

  # Create a new CartProduct and associate it with the user's cart
  current_user.cart.cart_products.create(product: product, student: student)

  redirect_to root_path, notice: 'Product added to cart'
end

  end

  def view_cart
    # Retrieve the stored cart_data from the session
    cart_data = session[:cart_data]
    
    if cart_data.nil?
      flash[:notice] = "Your cart is empty." # You can use flash messages to notify the user
      redirect_to root_path # Redirect to the root path or wherever you want
      return
    end

    # Create a cart_products record using cart_data
    @cart_product = CartProduct.new(
      program_id: cart_data[:program_id],
      student_id: cart_data[:student_id]
      # Add other relevant attributes as needed
    )

    if @cart_product.save
      # Cart product saved successfully, you can perform any additional actions here
    else
      flash[:alert] = "Error creating cart product." # Handle error gracefully
    end

    # Clear the session data
    session.delete(:cart_data)
    
    # Render the cart view or redirect to the cart page
    # Example: render 'carts/view_cart' or redirect_to cart_path(@cart_product.cart)
  end

  def checkout


  end


  
  def create
    @cart = current_user.cart
    @program = Program.find(params[:program_id]) # Assuming you have a Program model
    @cart_product = @cart.cart_products.build(program: @program)
  
    if @cart_product.save
      # Handle success
    else
      # Handle errors
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_program
    # @program = Program.find(params[:program_id])
  end
