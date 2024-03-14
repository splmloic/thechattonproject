# Preview all emails at http://localhost:3000/rails/mailers/user_order_mailer
class UserOrderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_order_mailer/order_confirmation
  def order_confirmation
    UserOrderMailer.order_confirmation
  end

end
