class CartsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_program, only: [:new, :index, :create, :show,:edit, :update, :destroy] 

  def index
  @cart = current_user.cart 
  @cart_products = @cart.cart_products if @cart.present?
  end


  def new
  end

  def show
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
