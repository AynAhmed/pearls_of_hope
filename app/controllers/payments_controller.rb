class PaymentsController < ApplicationController

  def create

    Stripe.api_key = ENV['STRIPE_SECRET_KEY']

    @payment = Payment.new(payment_params)

    # Charge user card
    Stripe::Charge.create({
      # Converted to cents
      amount: @payment.amount * 100, 
      currency: 'usd',
      source: params[:stripe_token],
      description: 'pearls of hope Program'
    })

    respond_to do |format|
      if @payment.save
        format.html { redirect_to carts_path, notice: 'Payment was successful. Thanks for your payment' }
      end
    end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    render :new
  end

  private

  def payment_params
    params.permit(:amount, :program_ids, :user_id)
  end


end