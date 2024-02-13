# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_cart
  before_action :set_gon_variables

  def show
    @render_cart = true
  end

  def add
    @product = Product.find_by(id: params[:id])
    return product_not_found unless @product
    
    if @cart.save
      return product_already_in_cart if @cart.cart_products.exists?(product_id: @product.id)
      
      @cart.cart_products.create(product: @product)
      flash[:notice] = 'Product added to cart successfully.'
    else
      flash[:alert] = 'Error: Cart could not be saved.'
    end
  
    respond_to do |format|
      format.turbo_stream { render turbo_stream: [turbo_stream.replace('cart', partial: 'carts/cart', locals: { cart: @cart })] }
      format.html { redirect_to cart_path }
    end
  end

  def remove
    cart_product = CartProduct.find_by(id: params[:id])
      
    if cart_product
      cart_product.destroy
      respond_to do |format|
        format.turbo_stream # Respond to turbo_stream format
        format.html { redirect_to cart_path } # Respond to HTML format with a redirect
      end
    else
      flash[:alert] = 'Cart product not found.'
      redirect_to root_path # Or wherever you want to redirect in case of error
    end
  end

  private

  def initialize_cart
    @cart ||= Cart.find_by(id: session[:cart_id])

    return unless @cart.nil?

    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

  def set_gon_variables
    gon.env_variables = {
      STRIPE_PUBLIC_KEY: ENV['STRIPE_PUBLIC_KEY'],
      STRIPE_SECRET_KEY: ENV['STRIPE_PRIVATE_KEY']
    }
  end

  def product_not_found
    flash[:alert] = 'Product not found.'
    redirect_back(fallback_location: root_path)
  end
  
  def product_already_in_cart
    flash[:notice] = 'Product is already in the cart.'
    redirect_back(fallback_location: root_path)
  end
end
