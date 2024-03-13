class CheckoutController < ApplicationController
       
    
    def create
          @total = params[:total].to_d
          @cart_items = params[:cart_items]
          @session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            line_items: [
              {
                price_data: {
                  currency: 'eur',
                  unit_amount: (@total*100).to_i,
                  product_data: {
                    name: 'Rails Stripe Checkout',
                  },
                },
                quantity: 1
              },
              metadata: {
                cart_items: @cart_items
              },
            ],
            mode: 'payment',
            success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
            cancel_url: checkout_cancel_url
          )
          redirect_to @session.url, allow_other_host: true
        end
      
        def success
          @session = Stripe::Checkout::Session.retrieve(params[:session_id])
          @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
          metadata_hash = @session.metadata.to_hash
          @cart_items = metadata_hash['cart_items']
        end
      
        def cancel
        end
end

