class CheckoutsController < ApplicationController

    before_action :authenticate_user!

    def show 
        current_user.set_payment_processor :stripe

        current_user.payment_processor.pay_customer

        @checkout_session = current_user.payment_processor.checkout(
                mode:'subscription',
                line_items: [{
                    price: 'price_1OaomCGFI1uaMnOfkJnvQeTE',
                    quantity: 1
                }],
                success_url: checkout_success_url
        )
    end

    def success

    end
end