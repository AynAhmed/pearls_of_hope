class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    helper_method :instructor?
    before_action :set_render_cart
    before_action :initialize_cart


    def set_render_cart
      @render_cart = false
    end




  private

  def initialize_cart
    @cart ||= Cart.find_by(id: session[:cart_id])

    if @cart.nil?
      @cart = Cart.create 
      session[:cart_id] = @cart.id
    end
  end

  def instructor?
    user_signed_in? && current_user.role == 'instructor'
  end

    protected
        def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :email, :role])
        end


  end
