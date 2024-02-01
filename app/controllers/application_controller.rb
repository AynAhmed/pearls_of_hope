class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    helper_method :instructor?

  private

  def instructor?
    user_signed_in? && current_user.role == 'instructor'
  end

    protected
        def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :email, :role])
        end
      

    
      before_action :initialize_session
      before_action :load_cart

      private

      def initialize_session
        session[:cart] ||= [] # empty cart = empty array
      end

      def load_cart
        @cart = Product.find(session[:cart])
      end
  end
