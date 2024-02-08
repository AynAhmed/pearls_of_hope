class PaymentsController < ApplicationController
  Stripe.api_key = ENV['STRIPE_SECRET_KEY']

  def create
    @payment = Payment.new(payment_params)

    #charge user card
    charge = Stripe::Charge.create({
      amount: @payment.amount * 100, #convert to cents
      currency: 'usd',
      source: params[:stripe_token],
      description: 'Pearls of hope'
    })

    @payment.save
    respond_to do |format|
      if @payment.save
        
        format.html { redirect_to programs_path, notice: "Payment was successful. Thanks for your payment" }
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


end
