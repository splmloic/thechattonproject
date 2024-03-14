class UserOrderMailer < ApplicationMailer
  default from: ENV['MAILJET_DEFAULT_FROM']
  
  
  def order_confirmation(user, order)
        @user = user
        @order = order
        @url = 'https://thechattonproject.fly.dev' 
    
        mail(to: @user.email, subject: 'Confirmation de commande')
  end
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_order_mailer.order_confirmation.subject
  #
 
end
