class UserOrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_order_mailer.order_confirmation.subject
  #
  def order_confirmation
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
