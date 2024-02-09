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

    if @product
      if @cart.save # Ensure that the cart is saved before proceeding
        current_cart_product = @cart.cart_products.find_by(product_id: @product.id)

        if current_cart_product
          flash[:notice] = 'Product is already in the cart.'
        else
          @cart.cart_products.create(product: @product)
          flash[:notice] = 'Product added to cart successfully.'
        end
      else
        flash[:alert] = 'Error: Cart could not be saved.'
      end
    else
      flash[:alert] = 'Product not found.'
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace('cart', partial: 'carts/cart', locals: { cart: @cart })]
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

    def initialize_cart
      @cart ||= Cart.find_by(id: session[:cart_id])

      return unless @cart.nil?

      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end

  private

  def set_gon_variables
    gon.env_variables = {
      STRIPE_PUBLIC_KEY: ENV['STRIPE_PUBLIC_KEY'],
      STRIPE_SECRET_KEY: ENV['STRIPE_SECRET_KEY']
    }
  end
end
