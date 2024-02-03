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

end
