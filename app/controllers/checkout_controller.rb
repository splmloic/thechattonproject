class CheckoutController < ApplicationController
       
    
    def create

      puts "#"*50
      puts "je suis dans create checkout"
      puts params
      puts "#"*50
          @total = params[:total].to_d
          @cart_id = params[:cart_id]
          @session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            metadata: {
              cart_id: @cart_id
            },
            line_items: [
              {
                price_data: {
                  currency: 'eur',
                  unit_amount: (@total*100).to_i,
                  product_data: {
                    name: 'Rails Stripe Checkout',
                  },
                },
                quantity: 1,
                
              },
              
            ],
            mode: 'payment',
            success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
            cancel_url: checkout_cancel_url
          )
          redirect_to @session.url, allow_other_host: true
        end
      
        def success
          puts "#"*50
          puts "je suis dans success checkout"
          puts params
          puts "#"*50
          @session = Stripe::Checkout::Session.retrieve(params[:session_id])
          @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
          @cart_id= @session.metadata.cart_id
          @cart = Cart.find(@cart_id)
          create_order(@cart)
          empty_cart
          
        end
      
        def cancel
        end

        def create_order(cart)
          @cart = cart
          @cart_items = @cart.cart_items

          @user = current_user
          @order = Order.new(user: @user)          
          @order_item = 0
          @cart_items.each do |cart_item|
            @order_item = OrderItem.create(order: @order, item: cart_item.item)
          end
          @order_items = @order.order_items
          @order.save
          puts "$"*10
          puts "j'ai créé une commande : #{@order}"
          puts "$"*10
        end

        def empty_cart
          current_user.cart.cart_items.destroy_all
          puts "$"*10
          puts "j'ai vidé le panier"
          puts "$"*10
        end
end

